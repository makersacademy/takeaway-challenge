require 'takeaway'
require 'menu'
require 'menu_listing'
require 'dish'
require 'order'
require 'order_listing'
require 'customer'
require 'message_client'

RSpec.describe 'placing an order' do
  let(:luigis_pizzeria) { Takeaway.new(pizza_menu) }
  let(:pizza_menu) { Menu.new }

  let(:sausage_pizza) { Dish.new(:sausage_pizza, 8.5) }
  let(:pepperoni_pizza) { Dish.new(:pepperoni_pizza, 7) }
  let(:margherita_pizza) { Dish.new(:margherita_pizza, 6) }
  let(:vegetarian_pizza) { Dish.new(:vegetarian_pizza, 6.5) }

  let(:sausage_listing) { MenuListing.new(sausage_pizza, 8) }
  let(:pepperoni_listing) { MenuListing.new(pepperoni_pizza, 2) }
  let(:margherita_listing) { MenuListing.new(margherita_pizza, 12) }
  let(:vegetarian_listing) { MenuListing.new(vegetarian_pizza, 5) }

  let(:sam) { Customer.new(:sam, ENV['MY_PHONE_NUMBER'], 100) }
  let(:jeff) { Customer.new(:jeff, 20) }

  before(:each) do
    pizza_menu.add_dishes(sausage_listing, pepperoni_listing, margherita_listing, vegetarian_listing)
  end

  describe 'a succesful order' do
    it 'allows a customer to select their items' do
      # given a customer
      luigis_pizzeria.begin_order_for(sam)

      # when they are finished making their choices
      luigis_pizzeria.add_to_order(pizza_menu.item 2)
      luigis_pizzeria.add_to_order(pizza_menu.item 3)
      luigis_pizzeria.add_to_order(pizza_menu.item 4)
      luigis_pizzeria.add_to_order(pizza_menu.item 4)
      luigis_pizzeria.remove_from_order(pizza_menu.item 3)

      # then they should be able to view their order before they confirm
      expect(luigis_pizzeria.view_current_order).to eq "Sam's order:\nPepperoni Pizza – Quantity: 1\nVegetarian Pizza – Quantity: 2"
    end

    it 'allows a customer to pay for their items' do
      # given a customer is satisfied with their choices
      luigis_pizzeria.begin_order_for(sam)
      luigis_pizzeria.add_to_order(pizza_menu.item 4)
      luigis_pizzeria.add_to_order(pizza_menu.item 2)
      luigis_pizzeria.add_to_order(pizza_menu.item 4)
      luigis_pizzeria.add_to_order(pizza_menu.item 2)
      luigis_pizzeria.add_to_order(pizza_menu.item 4)

      expect(luigis_pizzeria.view_current_order).to eq "Sam's order:\nVegetarian Pizza – Quantity: 3\nPepperoni Pizza – Quantity: 2"

      # when they place their order
      luigis_pizzeria.place_order

      # then they should be charged for their order
      expect(sam.balance).to be 66.5

      # and the order should be set aside for delivery
      luigis_pizzeria.begin_order_for(jeff)

      expect { luigis_pizzeria.add_to_order(pizza_menu.item 2) }.to raise_error Takeaway::OUT_OF_STOCK
    end
  end
end
