require "./lib/restaurant"
require "./lib/menu"
require "./lib/dish"

describe Restaurant do

  subject do
    dishes = [Dish.new("Burger", 8), Dish.new("Pizza", 10)]
    menu = Menu.new(dishes)
    Restaurant.new(menu)
  end

  it "has a menu" do
    expect(subject.menu.dishes.length).to eq(2)
  end

  it "can recieve order" do
    burger = Dish.new("Burger", 8)
    pizza = Dish.new("Pizza", 10)
    order_dishes = {burger => 1,
                    pizza => 2}
    order = subject.submit_order("Sarah", "0123456789", order_dishes, 28)
    expect(order.customer_name).to eq("Sarah")
  end

  it "raises an error when trying to order a dish not on the menu" do
    dishes = {Dish.new("Sushi", 20) => 1}
    expect{subject.submit_order("Sarah", "0123456789", dishes, 28)}.to raise_error "Dish not on menu"
  end

  it "raises an error if expetced sum is incorrect" do
    burger = Dish.new("Burger", 8)
    pizza = Dish.new("Pizza", 10)
    order_dishes = {burger => 1,
                    pizza => 2}
    expect{subject.submit_order("Sarah", "0123456789", order_dishes, 14)}.to raise_error "Sum is incorrect"
  end

end


# If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".


# xit "should see a list of dishes"
# xit "should be able to see list of dishes with prices"
# xit "should be able to see list of available dishes"
# xit "should be able to select a dish"
# xit "should be able to select more than one dish"
# xit "should only be able to select dish if available"
# xit "should be able to add prices of selected dished"
# xit "should be able to place order"
# xit "should raise an error if sum is not correct"
# xit "should be able to recieve text message when order placed"
