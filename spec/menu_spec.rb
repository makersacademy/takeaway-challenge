require 'menu'

RSpec.describe Menu do

  context "initially an empty hash" do
    it "returns string if no dishes added" do
      menu = Menu.new
      expect(menu.list).to eq "Nothing on menu"
    end
  end

  context "when fake dishes are added" do
    it "adds dishes to the menu and prints menu" do
      menu = Menu.new
      dish_1 = double :dish, name: "Bread", price: 3.99
      dish_2 = double :dish, name: "Pizza", price: 9.99
      dish_3 = double :dish, name: "Donut", price: 2.99
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      expect(menu.list).to eq ["Bread: £3.99", "Pizza: £9.99", "Donut: £2.99"]
    end
  
    it "removes dishes from the menu and prints menu" do
      menu = Menu.new
      dish_1 = double :dish, name: "Bread", price: 3.99
      dish_2 = double :dish, name: "Pizza", price: 9.99
      dish_3 = double :dish, name: "Donut", price: 2.99
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.remove(dish_1)
      expect(menu.list).to eq ["Pizza: £9.99", "Donut: £2.99"]
    end
  
    it "raises error if the same dish is added to menu" do
      menu = Menu.new
      dish_1 = double :dish, name: "Bread", price: 3.99
      dish_2 = double :dish, name: "Pizza", price: 9.99
      dish_3 = double :dish, name: "Donut", price: 2.99
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      expect{menu.add(dish_2)}.to raise_error "This dish is already on the menu"
    end
  
    it "raises error if nonexistent dish is removed from menu" do
      menu = Menu.new
      dish_1 = double :dish, name: "Bread", price: 3.99
      dish_2 = double :dish, name: "Pizza", price: 9.99
      dish_3 = double :dish, name: "Donut", price: 2.99
      dish_4 = double :dish, name: "Burrito", price: 12.99
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      expect{menu.remove(dish_4)}.to raise_error "This dish doesn't exist on the menu"
    end
  end

end