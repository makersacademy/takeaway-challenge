require 'order'
require 'menu'
require 'printer'
require 'order_checker'

describe 'User Stories' do

  context 'Allows a customer to see a list of dishes with prices' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
    it 'Allows method to be called without error' do
      order = Order.new
      expect { order.see_menu }.not_to raise_error
    end

    it 'Pretty prints the current menu' do
      order = Order.new
      expect(order.see_menu).to eq(
        "1. Sea salt & caramel, £3.5\n2. Chilli & chocolate, £3.5\n3. Avocado cream, £4.0\n4. Coconut, £3.0\n5. Praline, £3.7\n6. Watermelon sorbet, £3.5\n7. Wild strawberry, £4.5\n8. Dark chocolate & cherry, £5.5"
      )
    end
  end

  context 'Allows a customer to place an order' do
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
    it 'Allows method to be called without error' do
      order = Order.new
      order_array = [[[1,1], [3,1], [7,1]], 12]
      expect { order.place_order(order_array) }.not_to raise_error
    end
  end

  context 'Allows customer to check the order total' do
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
    it 'Raises an error if an incorrect order total is provided' do
      order = Order.new
      order_array = [[[1,1], [3,1], [7,1]], 15]
      expect { order.place_order(order_array) }.to raise_error("Incorrect order total provided!")
    end

    it 'Returns the total if the correct total was provided' do
      order = Order.new
      order_array = [[[1,1], [3,1], [7,1]], 12]
      expect(order.place_order(order_array)).to eq 12
    end
  end
end
