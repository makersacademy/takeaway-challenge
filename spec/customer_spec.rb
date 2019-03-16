require 'customer'

describe Customer do

  let(:customer) { Customer.new("Joe Bloggs") }

  it 'has a name when initialized' do
    expect(customer.name).to eq 'Joe Bloggs'
  end

  it 'can create an array' do
    expect(customer.contents).to eq []
  end

  it 'responds to basket method' do
    expect(customer).to respond_to(:add)
  end

  it 'can add to the array' do
    # dish = double :dish, name: "Pepperoni", price: 7
    # quantity = 2
    customer.add("Pepperoni", 2)
    expect(customer.contents).to eq [{ :name => "Pepperoni", :price => 7, :quantity => 2 }]
  end

  it 'can add two orders to the array' do
    customer.add("Meat feast", 1)
    customer.add("Pepperoni", 2)
    expect(customer.contents).to eq [{ :name => "Meat feast", :price => 8, :quantity => 1 },
    { :name => "Pepperoni", :price => 7, :quantity => 2 }]
  end

  it "should only work for dishes on menu" do
    expect { customer.add("Kebab", 1) }.to raise_error "Item not on menu"
  end

  it 'stores correct price' do
    customer.add("Pepperoni", 2)
    expect(customer.cost).to eq 14
  end

  it 'responds to basket method' do
    expect(customer).to respond_to(:basket)
  end

  it 'return correct contents' do
    # pizza = double("pizza")
    # quantity = double(1)
    # customer.add(pizza, quantity)
    # hit my raise error when using mocks, need to discuss
    customer.add("Pepperoni", 2)
    expect(customer.send(:display_contents)).to eq [{:name=>"Pepperoni", :price=>7, :quantity=>2}]
  end

  # private methods

  it "User can't call to calculate_cost method" do
    expect { customer.calculate_cost }.to raise_error(NoMethodError)
  end

  it "User can't call to display_contents method" do
    expect { customer.display_contents }.to raise_error(NoMethodError)
  end

end
