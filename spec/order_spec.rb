require 'menu'
require 'order'

describe Order do
  let(:menu) { double(:menu, print_dishes: Array) }
  let (:order) { Order.new(menu) }
  let (:test) { double(:order, gets: '1') }

  it 'should initialize with a list of dishes' do
    expect(order.menu).to eq(menu)
  end 

  it 'should allow the user to place an order' do
    expect(order.place_order).to eq(menu.print_dishes)
  end

  it "should assign current order with user input" do
    allow($stdin).to receive(:gets).and_return(1)
    order.take_order
    expect(order.current_order).to eql([1])
  end

  it "should assign current order with user input" do
    allow($stdin).to receive(:gets).and_return(2)
    order.take_order
    expect(order.quantity).to eql([2])
  end

  it 'should print out the full order with total cost' do
    expect(order.order_confirmation).to eq(true)
  end
end
