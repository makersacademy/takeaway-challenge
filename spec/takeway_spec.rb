require 'takeaway'

describe Takeaway do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'should show list of dishes with prices' do
    takeaway = Takeaway.new

    expect(takeaway.show_list).to eq takeaway.dishes
    
  end

# As a customr
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'allows to select available dish' do
    takeaway = Takeaway.new

    takeaway.add_to_order("rice")

    takeaway.order.should include("rice")

  end

  it 'does not allow to select unavailable dish' do
    takeaway = Takeaway.new

    takeaway.add_to_order("ham")

    takeaway.order.should_not include("ham")

  end
end
