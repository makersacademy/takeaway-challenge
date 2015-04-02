require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:line_1) { double :line_item, sub_total: 8, dish: "Cod", quantity: 2 }
  let(:line_2) { double :line_item, sub_total: 4, dish: "Chips", quantity: 2 }

  before do
    order.add_line line_1
  end

  it 'can generate a final bill with 1 line item' do
    bill_1 = "Thanks for your order\n2 x Cod = £8\nTotal = £8"
    expect(order.final_bill).to eq bill_1
  end

  it 'can generate a final bill with 2 line items' do
    order.add_line line_2
    bill_2 = "Thanks for your order\n2 x Cod = £8\n2 x Chips = £4\nTotal = £12"
    expect(order.final_bill).to eq bill_2
  end

  it 'can have a grand total' do
    expect(order.grand_total).to eq 8
  end
end
