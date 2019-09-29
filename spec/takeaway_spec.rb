require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'displays a menu' do
    expect(takeaway.menu).to eq "Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5
  end

  it 'can select a number of dishes' do
    takeaway.order("Chicken", 2)
    takeaway.order("Fish", 3)
    expect(takeaway.order_list).to eq [{dish_selection: "Chicken", quantity: 2}, {dish_selection: "Fish", quantity: 3}]
  end
end
