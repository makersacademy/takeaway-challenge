require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  
  it 'should return a list of dishes and their respective prices' do
    expect(takeaway.menu).to eq({:dish1=>1,:dish2=>2,:dish3=>3,:dish4=>4})
  end

  it 'should respond to #order with 2 arguments' do
    expect(takeaway).to respond_to(:place_order)
  end

  it 'stores an order with the name and quantity of dishes' do
    test_order = {:dish1=>3,:dish2=>2,:dish3=>5,:dish4=>1}
    # expected_total = (order[:dish1] * takeaway.menu[:dish1])
    #                + (order[:dish2] * takeaway.menu[:dish2])
    #                + (order[:dish3] * takeaway.menu[:dish3])
    #                + (order[:dish4] * takeaway.menu[:dish4])
    takeaway.place_order(test_order)
    expect(takeaway.order).to eq(test_order)
  end
end
