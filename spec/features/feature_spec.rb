require 'takeaway'

describe 'User Stories' do
  let(:takeaway) { Takeaway.new }

# User Story 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'the customer can view a list of dishes with prices' do
    restaurant = 'chicken shop'
    expect(takeaway.view_menu(restaurant)).to eq("1 piece chicken meal" => 4.49,
       "2 piece chicken meal" => 5.49,
        "chicken nuggets meal" => 4.49,
         "popcorn chicken meal" => 5.79,
          "spicy wings meal" => 5.49,
           "mega bucket meal" => 24.99)
  end

# User Story 2
# As a customer
# So that I can order the meal I want
# # I would like to be able to select some number of several available dishes

  it 'the customer can select several different dishes to order' do
    takeaway.order('spicy wings meal', 2)
    takeaway.order('mega bucket meal', 2)
    expect(takeaway.view_basket).to eq("spicy wings meal" => 10.98, "mega bucket meal" => 49.98)
  end

  xit 'raises an error if unavailable dishes are selected' do
    takeaway.order('quinoa salad', 2)
    expect { takeaway.order }.to eq "Sorry, your selection is unavailable"
  end #error testing not working

# User Story 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'checks that the total price matches the order' do
    takeaway.order('spicy wings meal', 2)
    takeaway.order('mega bucket meal', 2)
    expect(takeaway.total_bill).to be_within(0.1).of 60.94
  end
end
