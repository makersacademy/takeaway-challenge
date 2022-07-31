require 'takeaway'

describe Takeaway do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'should show list of dishes with prices' do
    takeaway = Takeaway.new({ "rice" => 1.25, "banana" => 1.00, "fries" => 2.10 })

    expect(takeaway.show_list).to eq takeaway.dishes
    
  end

# As a customr
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'allows to select available dish' do
    takeaway = Takeaway.new({ "rice" => 1.25, "banana" => 1.00, "fries" => 2.10 })

    takeaway.add_to_order("rice")

    takeaway.order.should include("rice")

  end

  it 'does not allow to select unavailable dish' do
    takeaway = Takeaway.new({ "rice" => 1.25, "banana" => 1.00, "fries" => 2.10 })

    takeaway.add_to_order("ham")

    takeaway.order.should_not include("ham")

  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'checks total price of order is correct' do
    takeaway = Takeaway.new({ "rice" => 1.25, "banana" => 1.00, "fries" => 2.10 })
    takeaway.add_to_order("rice")
    takeaway.add_to_order("banana")

    expect(takeaway.total_price).to eq 2.25

  end

end
