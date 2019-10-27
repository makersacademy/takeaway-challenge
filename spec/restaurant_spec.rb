require "restaurant"
require "menu"
describe Restaurant do

 let(:restaurant) { Restaurant.new }
 let(:menu) { Menu.new }
 let(:payment) { Payment.new }

  context "on opening the program" do
    # calling "load_menu" on restaurant instance creates a menu instance
    it "can load a menu" do
      restaurant.load_menu(menu)
      expect(restaurant.menu).to eq(menu)
    end

  end

  context "making an order" do
    # check restaurant instance has an order array
    it "has an array called order" do
      expect(restaurant.order).to be_a(Array)
    end
    # check order array is empty
    it "has an array called order which is empty" do
      expect(restaurant.order).to be_empty
    end
    # check can get a menu item from hash pushed to order array
    it "can choose an item and quantity from menu to order" do
      restaurant.load_menu(menu)
      dish = "char sui buns"
      quantity = 2
      ordered_dishes = [["char sui buns", 1.0], ["char sui buns", 1.0]]
      expect(restaurant.choose(dish, quantity)).to eq ordered_dishes
    end
    # can retrieve total cost of order
    it "calculates the total cost of order" do
      restaurant.load_menu(menu)
      dish = "char sui buns"
      quantity = 2
      restaurant.choose(dish, quantity)
      total_cost = 2.0
      expect(restaurant.total).to eq "Your total order will cost 2.0"
    end

  end

  context "paying" do
    # create instance of payment class to proceed with payment
    it "proceed to payment" do
      restaurant.load_menu(menu)
      dish = "char sui buns"
      quantity = 2
      restaurant.choose(dish, quantity)
      expect(restaurant.pay(payment)).to eq(payment)
    end

  end

end
