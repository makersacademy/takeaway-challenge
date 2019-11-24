require 'takeaway'
require 'menu'
require 'menu_listing'

RSpec.describe 'placing an order' do
  let(:luigis_pizzeria) { Takeaway.new(pizza_menu) }
  let(:pizza_menu) { Menu.new }

  let(:sausage_pizza) { Dish.new(:sausage_pizza, 8) }
  let(:pepperoni_pizza) { Dish.new(:pepperoni_pizza, 8) }
  let(:margherita_pizza) { Dish.new(:margherita_pizza, 8) }
  let(:vegetarian_pizza) { Dish.new(:vegetarian_pizza, 8) }

  let(:sausage_listing) { MenuListing.new(sausage_pizza, 8) }
  let(:pepperoni_listing) { MenuListing.new(pepperoni_pizza, 12) }
  let(:margherita_listing) { MenuListing.new(margherita_pizza, 2) }
  let(:vegetarian_listing) { MenuListing.new(vegetarian_pizza, 5) }

  before(:all) do
    pizza_menu.add_dishes(sausage_listing, pepperoni_listing, margherita_listing, vegetarian_listing)
  end
end
