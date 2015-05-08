require 'capybara/rspec'
require 'dish'
require 'menu'

feature 'Modifying dishes' do
  let(:menu) { Menu.new }
  let(:murtabak) { Dish.new 'murtabak', 10, 'It\'s yumm!' }
  let(:lasagne) { Dish.new 'lasagne', 7, 'Layers of meat and pasta' }

  before :each do
    menu.add_dish(murtabak)
    menu.add_dish(lasagne)
  end

  scenario 'dishes can be added to the menu' do
    expect(menu.dishes.include?(murtabak)).to eq true
    expect(menu.dishes.include?(lasagne)).to eq true
  end

  scenario 'dishes can be removed from the menu' do
    menu.remove_dish(murtabak)
    expect(menu.dishes.include?(murtabak)).to eq false
    menu.remove_dish(lasagne)
    expect(menu.dishes.include?(lasagne)).to eq false
  end

  # We don't want to change the properties of Dish directly right?
  # ^Think about this before moving on
  xscenario 'the menu can change the name of a dish'
  xscenario 'the menu can change the price of a dish'
  xscenario 'the menu can change the description of a dish'
end
