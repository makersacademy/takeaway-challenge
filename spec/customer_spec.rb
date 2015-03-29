require 'customer'

describe Customer do

  let(:customer) { described_class.new(name: "dan", phone: 666) }

  it 'takes an options hash on initialisation with name and number' do
    expect { customer }.not_to raise_error
  end

  it 'can show its name' do
    expect(customer.name).to eq 'dan'
  end

  it 'can show its phone number' do
    expect(customer.phone).to eq 666
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
    order_fwd = { from: customer, items: [[1, 1], [2, 1], [3, 1]], total: 7.97 }
    expect(cafe).to receive(:receive_order).with(hash_including(order_fwd))
    customer.order(order)
  end
end
