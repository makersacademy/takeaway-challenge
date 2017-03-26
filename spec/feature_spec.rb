require 'takeaway'

describe Takeaway do
  let(:menu_class){ double :menu_class, new: menu }
  let(:menu){ double :menu }
  let(:dish){ double :dish, price: 3 }
  subject(:takeaway){ described_class.new(menu_class) }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "displays a list of dishes with prices, so the customer can read_menu" do
    expect(takeaway.read_menu).to eq menu
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "selects a dish and places it in a basket, so the customer can place order" do
    expect(takeaway.order(dish)).to eq [dish]
  end

  it "displays the dishes in the basket that the customer has ordered" do
    takeaway.order(dish)
    takeaway.order(dish)
    expect(takeaway.view_basket).to eq [dish, dish]
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "checks that the total price matches sum of various dishes in order, so that the customer can verify order" do
    takeaway.order(dish)
    takeaway.order(dish)
    expect(takeaway.total).to eq dish.price * 2
  end
end
