require 'takeaway'
require 'dish'

describe "A Takeaway" do
  let(:takeaway)      { Takeaway.new([carbonara, roast_chicken, burger]) }
  let(:carbonara)     { Dish.new("Carbonara", 5) }
  let(:roast_chicken) { Dish.new("Roast Chicken", 12) }
  let(:burger)        { Dish.new("Burger", 7) }

  it "can add dishes from the menu to the order" do
    takeaway.add_to_order(carbonara)
    takeaway.add_to_order(roast_chicken)
    takeaway.add_to_order(burger)
    
    expect(takeaway.order).to include carbonara
    expect(takeaway.order).to include roast_chicken
    expect(takeaway.order).to include burger
  end

  it "can remove dishes from the order" do
    takeaway.add_to_order(carbonara)
    takeaway.remove_from_order(carbonara)
    expect(takeaway.order).to_not include carbonara
  end

  it "can list the dishes and their prices on a menu" do
    expect(takeaway.show_menu).to eq "#{carbonara.name}, #{carbonara.price}"
  end

end
