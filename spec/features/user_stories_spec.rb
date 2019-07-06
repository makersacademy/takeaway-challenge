describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "should provide a list of dishes with prices" do
    menu = Menu.new({"Tuna Tartare": 9.50, "Courgette Salad": 3.75, "Chips": 2.50})
    expect(menu.view).to eq "Tuna Tartare - £9.50\nCourgette Salad - £3.75\nChips - £2.50\n"
  end
  it "so user can see dishes and prices, instruct menu to provide dishes and prices" do
    menu = Menu.new
    dish = Dish.new
    expect { menu.price(dish) }.not_to raise_error
  end
  #   As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "so  that I can order a meal, I want to select several dishes" do
    menu = Menu.new
    dish = Dish.new
    order = Order.new(menu)
    expect { order.choose(dish) }.not_to raise_error
  end
  #   As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "checks that the total matches the sum of the dishes in the customer order" do
    menu = Menu.new
    dish = Dish.new
    order = Order.new(menu)
    dishes = order.list_dishes
    sum_of_dishes = (dishes.each { |dish| menu.price(dish) * order.quantity(dish) }).sum
    expect(order.total(menu)).to eq sum_of_dishes
  end
  # it "if total is incorrect, an error should be raised" do

end
