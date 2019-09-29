require 'takeaway'

describe Takeaway do

  let (:order) { double :order }

  subject(:takeaway) { described_class.new }

  it 'displays a menu' do
    expect(takeaway.menu).to eq "Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5
  end

  it 'can forward an order' do
    allow(order).to receive(:place) {[{dish_selection: "Chicken", quantity: 2}]}
    takeaway.place_order("Chicken", 2)
  end

  # it 'can calculate the sum' do
  #
  # end

  # it 'can select a number of dishes' do
  #   takeaway.order("Chicken", 2)
  #   takeaway.order("Fish", 3)
  #   expect(takeaway.order_list).to eq [{dish_selection: "Chicken", quantity: 2}, {dish_selection: "Fish", quantity: 3}]
  # end
  #
  # it 'can calculate the sum of the order' do
  #   takeaway.order("Chicken", 2)
  #   takeaway.order("Fish", 3)
  #   expect(takeaway.sum).to eq 31
  # end

end
