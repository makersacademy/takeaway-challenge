require 'customer'

describe Customer do

  it "can see list of dishes" do
    expect(subject.list_of_dishes).to eq(Menu::MENU)
  end

  it "can check if given total equals to order's total" do
    order = double :order
    allow(order).to receive(:total).and_return(35)
    cust = Customer.new(order)
    expect(cust.total_correct(35)).to eq(true)
  end

  it "can not place an order if it is empty" do
    order = double :order
    cust = Customer.new(order)
    expect{cust.place_order({}, 0)}.to raise_error "Order is empty"
  end

  it "can not place an order if total is wrong" do
    order = double :order, empty?: false
    allow(order).to receive(:total).and_return(35)
    cust = Customer.new(order)
    expect{cust.place_order({'pizza'=>2}, 33)}.to raise_error "Total is not correct"
  end

  it "receive a message if order is ok" do
    order = double :order, empty?: false
    allow(order).to receive(:total).and_return(35)
    cust = Customer.new(order)
    allow(cust).to receive(:send_text).and_return("Text sent!")
    expect(cust.place_order({'pizza'=>2}, 35)).to eq("Text sent!")
  end


end