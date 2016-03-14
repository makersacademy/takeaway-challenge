require 'takeaway'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Takeaway do
  subject(:takeaway) {described_class.new}
  it 'returns a list of dishes and their respective prices' do
    expect(takeaway).to respond_to(:menu)
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  describe '#place_order' do
    it 'stores an order with the name and quantity of dishes' do
      test_order = {:dish1=>3,:dish2=>2,:dish3=>5,:dish4=>1}
      # expected_total = (order[:dish1] * takeaway.menu[:dish1])
      #                + (order[:dish2] * takeaway.menu[:dish2])
      #                + (order[:dish3] * takeaway.menu[:dish3])
      #                + (order[:dish4] * takeaway.menu[:dish4])
      takeaway.place_order(test_order)
      expect(takeaway.order).to eq(test_order)
    end
  
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

    it 'returns the total cost of the order' do
      menu = {:dish1=>1,:dish2=>2,:dish3=>3,:dish4=>4}
      test_order = {:dish1=>3,:dish2=>2,:dish3=>5,:dish4=>1}
      expect(takeaway.place_order(test_order)).to eq 26
    end
  end
end
