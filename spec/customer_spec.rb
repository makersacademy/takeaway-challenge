require 'customer'

describe Customer do
  let(:dish) {double :dish}

  before :each do
    @customer = Customer.new
  end
  it "Has nothing in the order when created" do
    expect(@customer.order).to eq []
  end

  it "Can add a single dish to the order" do
    @customer.add_to_order(dish)
    expect(@customer.order).to eq [dish]
  end

  it "Can add multiple of the same dish to the order" do
    @customer.add_to_order(dish, 2)
    expect(@customer.order).to eq [dish, dish]
  end
end
