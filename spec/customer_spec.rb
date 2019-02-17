require 'customer'

describe Customer do
  let(:dish) {double :dish}

  before :each do
    @customer = Customer.new
  end
  context "when created" do

    it "has nothing in the order" do
      expect(@customer.order).to eq []
    end

    it "can return the total price of the order is 0" do
      expect(@customer.order_total).to eq 0
    end
  end

  it "can add a single dish to the order" do
    @customer.add_to_order(dish)
    expect(@customer.order).to eq [dish]
  end

  it "can add multiple of the same dish to the order" do
    @customer.add_to_order(dish, 2)
    expect(@customer.order).to eq [dish, dish]
  end

  it "has an order that costs £20 when £20 worth of dishes are ordered" do
    allow(dish).to receive(:price).and_return(500)
    dish2 = double(:dish2, :price => 1000)
    @customer.add_to_order(dish, 2)
    @customer.add_to_order(dish2, 1)
    expect(@customer.order_total).to eq 2000
  end

  it "has an order that costs £30 when £30 worth of dishes are ordered" do
    allow(dish).to receive(:price).and_return(3000)
    @customer.add_to_order(dish)
    expect(@customer.order_total).to eq 3000
  end
end
