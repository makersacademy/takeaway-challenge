require 'customer'

describe Customer do

  let(:customer) { Customer.new "Customer", 447799123123}
  let(:order) { double :order }
  let(:order_class) { double :order_class, :new => order }

  it "has a name" do 
    expect(customer.name).to eq "Customer"
  end
  
  it "has a UK telephone number" do
    expect(customer.telephone).to eq 447799123123
  end 

  it "can start an order" do
    expect(order_class).to receive :new
    customer.start_order order_class
  end  

  it "can start an order" do
    customer.start_order order_class
    expect(customer.order).to eq order

  end  

  it "can look at the menu" do
    allow(order_class).to receive(:new)
    allow(order).to receive(:look_at_menu)
    expect(customer.order).to receive :look_at_menu
    customer.start_order order_class
    customer.look_at_menu

  end
  
  it "can pick the items it wants" do
    allow(order).to receive(:pick).with(anything())
    expect(order).to receive(:pick).with([:salad, :fish])
    customer.start_order order_class
    customer.pick(:salad, :fish)
  end

  it "can place an order" do
    allow(order).to receive(:place_order)
    expect(order).to receive(:place_order)
    customer.start_order order_class
    customer.place_order
  end

  it "can confirm the order and recieve text message" do
    allow(order).to receive(:confirm_order)
    expect(order).to receive(:confirm_order)
    customer.start_order order_class
    customer.confirm_order
  end  

end