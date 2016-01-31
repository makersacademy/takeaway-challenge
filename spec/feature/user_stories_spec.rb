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
    expect(take_away.basket_summary).to eq "Egg Fried Rice x2: £3.80\n"
  end
  
  #  As a customer
  #  So that I can verify that my order is correct
  #  I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'checks that the total is correct' do
    take_away = TakeAway.new
    message = "Thank you! Your order was placed."
    take_away.order "Egg Fried Rice", 2
    take_away.order "Spring Roll"
    allow(take_away).to receive(:send_text).with(message)
    expect(take_away).to receive(:send_text).with(message)
      take_away.complete_order(5.3)
  end
end