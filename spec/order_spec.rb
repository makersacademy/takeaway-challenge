require './lib/order.rb'

describe Order do

  it 'should create the menu when initialized' do
  order = Order.new
    expect(order.menus).to include("Edemame" => 2)
  end

  it 'should display the menu correctly when asked to do so' do
  order = Order.new
    expect { order.display_menu }.to output{"vegetable curry : £12\nCalifornia Roll : £4\nEdemame : £2
Burrata : £6\nTricolore Salad : £10"}.to_stdout
  end

  it 'should create an instance of the order class' do
    order = Order.new
    expect(order).to be_an_instance_of(Order)
  end

  it 'should allow me to select certain items from the menu' do
    order = Order.new
    expect(order).to respond_to(:select_item)
  end

  it 'should add items to the order' do
    order = Order.new
    order.select_item("Burrata")
    expect(order.ordered).to include("Burrata")
  end

  it 'should return the correct total price' do
    order = Order.new
    order.select_item("Burrata")
    expect(order.total).to eq(6)
  end
end
