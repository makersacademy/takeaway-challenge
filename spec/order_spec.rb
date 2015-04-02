require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:line_item) { double :line_item, sub_total: 8, dish: { "Cod" => 2 } }

  before do
    order.add_line line_item
    puts order.inspect
  end

  it 'can have a line item' do
    puts order.final_bill.inspect
    # expect(order.final_bill).to eq ###
  end

  # it 'can have a grand total' do
  #
  # end
end
