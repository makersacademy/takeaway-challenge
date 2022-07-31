require "order"

describe Order do

  it " has the instance of the class Order" do
    expect(subject).to be_kind_of(Order)
  end 

  it "selects a single dish" do
    order = Order.new
    order.take_order("misosoup", 1)
    order.take_order("sashimi", 5)
    expect(order.basket).to eq([
      {
        name: "misosoup",
        price: 6,
        amount: 1
      },
      {
        name: "sashimi",
        price: 4,
        amount: 5
      }
    ])
  end 

  it "outputs how many portions were added to the basket" do
    order = Order.new
    expect{order.take_order("misosoup", 4)}.to output("4x misosoup was added to your basket\n").to_stdout
  end 

end 