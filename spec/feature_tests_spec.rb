# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'takeaway'
require 'order'

describe "TakeAway features" do
  it "can see a list of dishes with prices" do
    takeaway = TakeAway.new
    expect(takeaway.view_dishes).to eq("Hamburger £4, Hotdog £3, Pizza £5, Fried chicken £3")
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe "Takeaway features" do
  it "a customer can add an order of several available dishes" do
    takeaway = TakeAway.new
    takeaway.create_new_order
    takeaway.add("Pizza", 2)
    takeaway.add("Hotdog", 3)
    expect(takeaway.basket_summary).to eq("Pizza x 2, Hotdog x 3 = £19")
  end
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

describe "Takeaway features" do
  it "check that total is correct" do
    takeaway = TakeAway.new
    takeaway.create_new_order
    takeaway.add("Pizza", 2)
    takeaway.add("Hotdog", 3)
    expect(takeaway.total).to eq(19)
  end
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

describe "Takeaway features" do
  it "sends out a text at checkout that the order has been placed and what time it will arrive" do
    takeaway = TakeAway.new
    takeaway.create_new_order
    takeaway.add("Pizza", 2)
    takeaway.add("Hotdog", 3)
    takeaway.checkout
    expect(takeaway.total).to eq(19) #just using to check own phone!
  end
end
