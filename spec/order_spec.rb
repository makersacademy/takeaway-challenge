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
    order.select_item("Burrata", 1)
    expect(order.ordered).to include("Burrata")
  end

  it 'should return the correct total price' do
    order = Order.new
    order.select_item("Burrata", 2)
    expect(order.total).to eq(12)
  end

  it 'should raise an error if the customer enters a wrong order total' do
    order = Order.new
    order.select_item("Burrata", 3)
    expect {order.place_order(12)}.to raise_error "The total is not correct. The correct total is £18"
  end

  it 'should place the order' do
      order = Order.new
      order.select_item("Burrata", 3)
      order.select_item("Curry", 1)
      order.select_item("Salad", 3)
      order.select_item("Edemame", 2)
      expect { order.place_order(64) }.to output{"Edemame : 2
Salad : 3
Curry : 1
Burrata : 3
Total = 64"}.to_stdout
    end

    it 'should send a text when the order is completed' do
      
    end
end
