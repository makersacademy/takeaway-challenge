require 'menu'
describe "User Stories" do
  
  #  As a customer
  #  So that I can check if I want to order something
  #  I would like to see a list of dishes with prices
  it 'allows people to read menu' do
    takeaway = TakeAway.new
    expect(takeaway.read_menu).to include "Egg Fried Rice"
  end
end