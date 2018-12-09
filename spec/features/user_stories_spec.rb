describe 'User stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customers can order something, list menu with prices' do
    dish1 = Dish.new(:butter_chicken, 4)
    dish2 = Dish.new(:lamb_tikka, 5)

    menu = Menu.new
    menu.add(dish1)
    menu.add(dish2)

    curry_house = Takeaway.new(menu)

    expect(curry_house.menu).to eq({
      butter_chicken: 4,
      lamb_tikka: 5
    })
  end
end
