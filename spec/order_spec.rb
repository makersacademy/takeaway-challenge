require "order"

describe Order do

  it " has the instance of the class Order" do
    expect(subject).to be_kind_of(Order)
  end 

  it "selects some numbers of several dishes " do
    order = Order.new
    order.take_order("misosoup")
    expect(order.basket).to eq([{ misosoup: 6 }])
  end 

end 