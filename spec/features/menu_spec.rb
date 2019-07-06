
describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "so user can see dishes and prices, instruct menu to provide dishes and prices" do
    menu = Menu.new
    dish = Dish.new
    expect { menu.price(dish) }.not_to raise_error
  end
end
