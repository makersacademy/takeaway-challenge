describe 'User Stories' do

let(:menu) { Menu.new }
let(:curry) { Dish.new("Vindaloo", 8)}
let(:pizza) {Dish.new("Pepperoni Pizza", 7)}
let(:kebab) {Dish.new("Doner Kebab", 8)}
let(:cart) {Cart.new}

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'allows the user to see a list of dishes and their prices' do
    menu.add(curry)
    expect(menu.list).to include curry
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'allows the user to select items of the menu in the quantity that they specify' do
      menu.add(curry)
      menu.add(pizza)
      cart.add_to_basket(curry, 1)
      cart.add_to_basket(pizza, 2)
      expect(cart.basket).
      to eq([{:name => "Vindaloo", :price => 8, :quantity => 1},
        {:name => "Pepperoni Pizza", :price => 7, :quantity => 2}])
  end

end
