require 'customer'

describe Customer do
  let(:customer){Customer.new(:name => "Thomas")}
  let(:schnitzel){double :dish, name: "Schnitzel", price: 4}
  let(:pie){double :dish, name: "pie", price: 2}
  let(:menu){double :menu}
  
  it "has a name and a telephone number" do
    expect(customer).to respond_to(:name, :tel, :order)
  end

  it "can use Menu's custom_order method" do
    order2 = [pie, pie, schnitzel, pie]
    expect(menu).to receive(:custom_order).with order2, 4
    menu.custom_order(order2, 4)
  end

  it "can choose dishes" do
    customer.choose(schnitzel)
    customer.choose(pie)
    customer.choose(pie)
    customer.choose(pie)
    customer.choose(pie)
    expect(customer.order).to eq([schnitzel, pie, pie, pie, pie])
  end
end