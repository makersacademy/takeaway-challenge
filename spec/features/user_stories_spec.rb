require 'menu'
require 'dish'
describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  let(:dish1) { double :dish, name: "Dish1", price: 3.00 }
  let(:dish2) { double :dish2, name: "Dish2", price: 4.95 }
  it "should provide a list of dishes with prices" do
    menu = Menu.new([dish1, dish2])
    expect(menu.view).to eq "Dish1 - £3.00\nDish2 - £4.95\n"
  end
  #   As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "so that I can order a meal, I want to select several dishes" do
    #dish = Dish.new("Tuna Tartare", 9.00)
    order = Order.new
    order.add(dish1, 5)
    order.add(dish2, 2)
    expect(order.list_dishes).to eq [[dish1, 5],[dish2,2]]
  end
  #   As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  let(:dish) { double :dish }
  it "checks that the total matches the sum of the dishes in the customer order" do
    dish = Dish.new("Tuna Tartare", 9.00)
    dish2 = Dish.new("Courgette Salad", 4.25)
    dish3 = Dish.new("Chips", 1.65)
    order = Order.new
    order.add(dish, 1)
    order.add(dish2, 2)
    order.add(dish3, 3)
    sum_of_dishes = (1 * 9.00) + (4.25 * 2) + (1.65 * 3)
    expect(order.total).to eq sum_of_dishes
  end

  it "#total_quantity should return the total number of items in the order" do
    order = Order.new
    quantity1 = rand(999)
    quantity2 = rand(999)
    order.add(dish1, quantity1)
    order.add(dish2, quantity2)
    expect(order.total_quantity).to eq(quantity1 + quantity2)
  end
  #it "if total is incorrect, an error should be raised" do


end
