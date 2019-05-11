require 'takeaway'
require 'menu'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  menu = Menu.new

  it "shows menu" do
    expect(takeaway.display(menu)).to eq(menu.items)
  end

  it "add quantity of selected items to basket" do
    #3.times basket.choose("dish_one")
    takeaway.add_to_basket("dish_one", 3)
    expect(takeaway.basket.length).to eq(3)
  end


end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been
  # given matches the sum of the various dishes in my order

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was
  # placed and will be delivered before 18:52" after I have ordered
