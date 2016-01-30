require 'menu'
describe "User Stories" do
  
  #  As a customer
  #  So that I can check if I want to order something
  #  I would like to see a list of dishes with prices
  it 'allows people to read menu' do
    take_away = TakeAway.new
    expect(take_away.read_menu).to include "Egg Fried Rice"
  end
  
  #  As a customer
  #  So that I can order the meal I want
  #  I would like to be able to select some number of several available dishes
  it 'allows people to place an order' do
    take_away = TakeAway.new
    take_away.order "Egg Fried Rice", 2
    expect(take_away.basket_summary).to eq "Egg Fried Rice x2: £3.80"
  end
end