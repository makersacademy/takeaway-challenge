require 'customer'

describe Customer do
  let(:customer){Customer.new(:name => "Thomas", :order => order)}
  let(:schnitzel){double :dish, name: "Schnitzel", price: 4}
  let(:pie){double :dish, name: "pie", price: 2}
  let(:order){double :order, order_sum: 2, dishes: [schnitzel, pie]}
  let(:menu){double :menu}
  
  it "has a name and a telephone number" do
    expect(customer).to respond_to(:name, :tel, :order)
  end

  it "can use Menu's custom_order method" do
    order2 = [pie, pie, schnitzel, pie]
    expect(menu).to receive(:custom_order).with order2, 4
    menu.custom_order(order2, 4)
  end


end