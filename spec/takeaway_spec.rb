require './docs/takeaway'

describe Takeaway do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'prints the dishes and their prices' do
    takeaway = Takeaway.new

    expect(takeaway.dishes).to eq "Beef curry: £12 Fish curry: £14 Lamb curry: £10"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'selects several dishes and adds them to order' do
    takeaway = Takeaway.new
    takeaway.add_to_order("Beef curry")
    takeaway.add_to_order("Fish curry")

    expect(takeaway.my_order).to eq [{:name=>"Beef curry", :price=>12}, {:name=>"Fish curry", :price=>14}]
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'prints each item with the cost and the total price of all items in my order' do
    takeaway = Takeaway.new
    takeaway.add_to_order("Beef curry")
    takeaway.add_to_order("Fish curry")

    expect(takeaway.basket_total).to eq 26
  end
end
