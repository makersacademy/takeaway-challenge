require 'order'

describe Order do

  it "takes user's order and returns it" do
    subject.order
    order = double
    order.stub(:gets).and_return("Lassagna")
    allow($stdin).to receive(:gets).and_return(order)
    # expect(order).to receive(:chomp).and_return()
    expect(subject.total_order.length).to eq(1)
  end


  it "Populates the array order with customer orders" do

  end
end