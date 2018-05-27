# to do:
# all the whatsapps
# buy marmot
# learn rahul's markdown user story software
# get better at pry

require 'menu'
require 'order'

describe 'user stories' do

  # User story 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "checks the user can see a list of dishes with prices" do
    menu = Menu.new
    expect(STDOUT).to receive(:puts)
    menu.view
  end

# user story 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it "allows the customer to select several dishes" do
    order = Order.new
    order.select_dish(:roast_goose, 3)
    expect(order.basket[:roast_goose]).to eq 3
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "checks total order = sum of orders" do
    order = Order.new
    order.select_dish(:roast_goose, 3)
    order.select_dish(:deep_fried_goose, 5)
    expect(order.total).to eq 8
  end

end
