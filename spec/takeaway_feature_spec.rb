require 'takeaway'
require 'dish'

describe "A Takeaway" do
  let(:takeaway)      { Takeaway.new(mockMenu, mockOrder) }
  let(:carbonara)     { Dish.new("Carbonara", 5) }
# let(:carbonara)     { Dish.new("Carbonara", 5) }
# let(:roast_chicken) { Dish.new("Roast Chicken", 10) }
# let(:pizza)         { Dish.new("Pizza", 7) }
  let(:mockMenu) { double :menu, dishes: [carbonara] }
  let(:mockOrder) { double :order, include?: carbonara, add: [carbonara] }
# let(:mockDish) { double :dish, name: "Spaghetti Carbonara", price: "£3"}

  it "can add dishes from the menu to the order" do
    takeaway.add_to_order(carbonara)
    expect(takeaway.order).to include carbonara
  end

# it "can remove dishes from the order" do
#   expect(takeaway.remove_from_order(mockDish)).to_not include mockDish
# end

  it "can list the dishes and their prices on a menu" do
    expect(takeaway.show_menu).to eq "#{carbonara.name}, #{carbonara.price}"
  end

end
