require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:line_item) { double :line_item, sub_total: 8, dish: { "Cod" => 2 } }
  let(:line_item_2) { double :line_item, sub_total: 4, dish: { "Chips" => 2 } }

  before do
    order.add_line line_item
  end

  it 'can generate a final bill with 1 line item' do
    bill_1 = "Thanks for your order\n2 x Cod = £8\nGrand total = £8"
    expect(order.final_bill).to eq bill_1
  end

  it 'can generate a final bill with 2 line items' do
    order.add_line line_item_2
    bill_2 = "Thanks for your order\n2 x Cod = £8\n2 x Chips = £4\nGrand total = £12"
    expect(order.final_bill).to eq bill_2
  end

  # it 'can have a grand total' do
  #
  # end
end
