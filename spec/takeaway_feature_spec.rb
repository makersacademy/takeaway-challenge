require 'takeaway'
require 'dish'

describe "A Takeaway" do
  let(:takeaway)      { Takeaway.new }
  # let(:carbonara)     { Dish.new("Carbonara", 5) }
  # let(:roast_chicken) { Dish.new("Roast Chicken", 12) }
  # let(:burger)        { Dish.new("Burger", 7) }

  it "can add dishes from the menu to the order" do
    takeaway.add_to_order(takeaway.menu.dishes[0])
    takeaway.add_to_order(takeaway.menu.dishes[1])
    takeaway.add_to_order(takeaway.menu.dishes[2])
    
    expect(takeaway.order.basket).to include takeaway.menu.dishes[0]
    expect(takeaway.order.basket).to include takeaway.menu.dishes[1]
    expect(takeaway.order.basket).to include takeaway.menu.dishes[2]
  end

  it "can remove dishes from the order" do
    takeaway.add_to_order(takeaway.menu.dishes[0])
    takeaway.remove_from_order(takeaway.menu.dishes[0])
    expect(takeaway.order.basket).to_not include takeaway.menu.dishes[0]
  end

  it "can list the dishes and their prices on a menu" do
    expect(takeaway.show_menu).to include "#{takeaway.menu.dishes[0].name}, £#{takeaway.menu.dishes[0].price}"
    expect(takeaway.show_menu).to include "#{takeaway.menu.dishes[1].name}, £#{takeaway.menu.dishes[1].price}"
    expect(takeaway.show_menu).to include "#{takeaway.menu.dishes[2].name}, £#{takeaway.menu.dishes[2].price}"
  end

  it "can show the customer their current order and total" do
    takeaway.add_to_order(takeaway.menu.dishes[0])
    takeaway.add_to_order(takeaway.menu.dishes[1])
    expect(takeaway.print_basket).to eq("#{takeaway.menu.dishes[0].name} - #{takeaway.menu.dishes[0].price}\n#{takeaway.menu.dishes[1].name} - #{takeaway.menu.dishes[1].price}\nTotal: #{takeaway.menu.dishes[0].price + takeaway.menu.dishes[1].price}")
  end

  it "can send customers a text when completing orders" do
    takeaway.add_to_order(takeaway.menu.dishes[0])
    takeaway.add_to_order(takeaway.menu.dishes[1])
    expect(takeaway.checkout.body).to eq "Sent from your Twilio trial account - Your order will be ready in an hour"
    
  end

end
