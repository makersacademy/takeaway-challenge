require 'order'
require 'pry'

describe Order do

  let(:menu) { double :menu, items: { "Tea" => 1.55, "Coffee" => 2.55 } }
  let(:order) { Order.new(menu) }

  it 'takes an order' do
    order.add("Tea", 2)
    expect(order.items).to eq({ "Tea" => 2 })
  end

  it 'displays menu' do
    expect(order.display_menu).to eq("Tea £1.55\nCoffee £2.55")
  end

  it 'displays total' do
    order.add("Tea", 1)
    expect(order.total).to eq(1.55)
  end

  it 'raises an error if customer tries to complete order with incorrect total' do
    order.add("Tea", 1)
    expect { order.complete(5.00) }.to raise_error "Total incorrect, please try again"
  end

end
