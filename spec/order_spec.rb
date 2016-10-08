# CREATE A NEW CLASS - ORDER CLASS
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes


# 1. create an order method which asks you to select what dish you would like.
# 2. create an order method which asks you how many you would like of each dish.
require 'order'
describe Order do
  subject(:order) {described_class.new}
  # it 'has a list of dishes' do
  #   take_away_menu.list_dishes
  #   expect(take_away_menu).to respond_to(:list_dishes)
  # end

  it 'has a method that asks if you would like to place an order' do
  order.place_an_order
  expect(order).to respond_to :place_an_order
  end
end
