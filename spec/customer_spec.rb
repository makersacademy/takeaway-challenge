require 'customer'

describe Customer do
  let(:customer){Customer.new(:name => "Thomas", :order => order)}
  let(:schnitzel){double :dish, name: "Schnitzel", price: 4}
  let(:pie){double :dish, name: "pie", price: 2}
  let(:order){double :order, order_sum: 2, dishes: [schnitzel, pie]}
  
  it "has a name and a telephone number" do
    expect(customer).to respond_to(:name)
  end


end