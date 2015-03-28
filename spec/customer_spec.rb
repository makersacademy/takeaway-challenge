require 'customer'

describe Customer do

  it 'takes an options hash on initialisation' do
    expect { described_class.new(options: "hash") }.not_to raise_error
  end

  it 'can view a menu' do
    restaurant = double :restaurant, show_menu: "1. Big Mac - £3.99"
    customer = described_class.new(options: "hash")
    expect(customer.view_menu(restaurant)).to eq "1. Big Mac - £3.99"
  end

  it 'can place an order' do
    customer = described_class.new(options: "hash")
    cafe = double :restaurant
    order = { restaurant: cafe, items: [[1, 1], [2, 1], [3, 1]], total: 7.97 }
    order_forward = { items: [[1, 1], [2, 1], [3, 1]], total: 7.97 }
    expect(cafe).to receive(:receive_order).with(hash_including(order_forward))
    customer.order(order)
  end
end
