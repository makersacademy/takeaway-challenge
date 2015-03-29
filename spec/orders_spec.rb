require 'orders'

describe Orders do
  let(:orders) { described_class.new }
  let(:items) { double :items }
  let(:item) { double :book1 }

  it 'prints the items in a menu' do
    expect(orders.print_menu).not_to eq nil
  end

  it 'takes orders into order list' do
    orders.place_order(:book1)
    expect(orders.order_list).to include(:book1)
  end
end
