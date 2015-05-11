feature 'customer wants to order a meal' do
  scenario 'customer wants to see a list of dishes and prices' do
    quiche = Dish.new("food", "price")
    soup = Dish.new("food", "price")
    sandwich = Dish.new("food", "price")
    fish = Dish.new("food", "price")
    steak = Dish.new("food", "price")
    expect(food.count(dish)).to eq(5)
  end
end