require 'order'

RSpec.describe Order do

  context "initially an empty hash" do
    it "returns string if no dishes added when checking dishes" do
      menu = double :menu
      order = Order.new(menu)
      expect(order.check_dishes).to eq "Nothing on order"
    end

    it "returns string if no dishes added when checking price" do
      menu = double :menu
      order = Order.new(menu)
      expect(order.check_price).to eq "Nothing on order"
    end
  end

  context "when fake dishes are added" do
    it "adds dishes to the order and checks dishes" do
      menu = double :menu, remove: true
      order = Order.new(menu)
      dish_1 = double :dish, name: "Fries", price: 3.99
      dish_2 = double :dish, name: "Burger", price: 9.99
      order.add(dish_1)
      order.add(dish_2)
      expect(order.check_dishes).to eq ["Fries: £3.99", "Burger: £9.99"]
    end
  
    it "removes dishes from the order and prints dishes" do
      menu = double :menu, remove: true
      dish_1 = double :dish, name: "Bread", price: 3.99
      dish_2 = double :dish, name: "Pizza", price: 9.99
      dish_3 = double :dish, name: "Donut", price: 2.99
      order = Order.new(menu)
      order.add(dish_1)
      order.add(dish_2)
      order.add(dish_3)
      order.remove(dish_1)
      expect(order.check_dishes).to eq ["Pizza: £9.99", "Donut: £2.99"]
    end
  
    it "raises error if nonexistent dish is added to order" do
      menu = double :menu, remove: false
      dish_1 = double :dish, name: "Bread", price: 3.99
      order = Order.new(menu)
      expect{order.add(dish_1)}.to raise_error "This dish doesn't exist on the menu"
    end

    it "adds dishes to my order and calculates total" do
      menu = double :menu, remove: true
      dish_1 = double :dish, name: "Bread", price: 3.99
      dish_2 = double :dish, name: "Pizza", price: 9.99
      dish_3 = double :dish, name: "Donut", price: 2.99
      order = Order.new(menu)
      order.add(dish_1)
      order.add(dish_2)
      order.add(dish_3)
      order.remove(dish_1)
      expect(order.check_price).to eq "£12.98"
    end
  end

  context "checks the order is complete" do
    it "returns true when order is submitted" do
      menu = double :menu
      order = Order.new(menu)
      order.submit
      expect(order.completed?).to eq true
    end

    it "returns false when order is not submitted" do
      menu = double :menu
      order = Order.new(menu)
      expect(order.completed?).to eq false
    end
  end
end