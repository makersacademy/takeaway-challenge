require 'takeaway'
require 'menu'
require 'dishes'

describe Takeaway do
  golden_orient = Takeaway.new
  fried_rice = Dishes.new("Fried Rice", 2)
  fried_noodle = Dishes.new("Fried Noodle", 2)
  golden_orient.order(fried_rice, 1)
  let(:sms) {instance_double("SMS", deliver: nil)}

  it 'allows customer to choose dishes from menu' do
    expect(golden_orient).to respond_to(:order)
  end

  it 'stores the dishes ordered' do
    expect(golden_orient.order_list).to include(fried_rice => 1)
  end

  it 'shows the total quanity ordered' do
    golden_orient.order(fried_noodle, 3)
    expect(golden_orient.order_quantity).to eq 4
  end

  # it 'places order' do
  #   expect(golden_orient.place_order).to eq "Thank you! Your order was placed and will be delivered before 18:52"
  # end

  # it 'sends an SMS when the order has been placed' do
  #   expect(sms).to receive(:deliver)
  #   golden_orient.place_order
  # end
end
