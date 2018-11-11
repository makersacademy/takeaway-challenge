require 'takeaway'

# User Story 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe 'User Stories' do
  let(:takeaway) { Takeaway.new }

  it 'the customer can view a list of dishes with prices' do
    expect(takeaway.view_menu).to eq("1 piece chicken meal" => 4.49,
       "2 piece chicken meal" => 5.49,
        "chicken nuggets meal" => 4.49,
         "popcorn chicken meal" => 5.79,
          "spicy wings meal" => 5.49,
           "mega bucket meal" => 24.99)
  end

end
