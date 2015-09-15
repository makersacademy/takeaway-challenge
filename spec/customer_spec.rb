require 'customer'

describe Customer do

  it "can see list of dishes" do
    expect(subject.list_of_dishes).to eq(Menu::MENU)
  end

  it "can add dish" do
    order = double :order
    cust = Customer.new(order)
    expect(order).to receive(:add_dish).with('pizza',1)
    cust.add_dish('pizza',1)
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
    expect{cust.place_order({'dip'=>2},3)}.to raise_error "Total is not correct"
  end

  it "receive a message if order is ok" do
    order = double :order, empty?: false
    allow(order).to receive(:total).and_return(35)
    twilio_text = double :twilio_text
    allow(twilio_text).to receive(:send_text).and_return("Text sent!")
    cust = Customer.new(order, twilio_text)
    expect(cust.place_order({'pizza'=>2}, 35)).to eq("Text sent!")
  end

  it "knows the list of ordered dishes" do
    order = double :order
    allow(order).to receive(:dishes).and_return('pizza'=>1)
    cust = Customer.new(order)
    expect(cust.list).to eq('pizza'=>1)
  end


end