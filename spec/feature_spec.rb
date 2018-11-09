require 'takeaway'

describe Takeaway do
  let(:takeaway) { Takeaway.new }
  let(:order) { Order.new }

  context 'User stories' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'shows list of dishes with prices' do
      expect { takeaway.show_menu }.not_to raise_error
    end
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'lets customer to place an order with dishes and their quantity' do
      order.select_dish("Chicken Curry", 1)
      order.select_dish("Lamb Curry", 2)
      expect { takeaway.place(order) }.not_to raise_error
    end
    it 'does not let customer select dishes that are not available' do
      expect { order.select_dish("Fish & Chips", 1) }.to raise_error "Can't select: dish not available"
    end
    # # As a customer
    # # So that I can verify that my order is correct
    # # I would like to check that the total I have been given matches the sum of the various dishes in my order
    # skip it 'checks if the total given is the same as the one calculated' do
    #   takeaway = Takeaway.new
    #   order = Order.new
    #   order.select_dish("Chicken Curry", 1)
    #   order.select_dish("Lamb Curry", 1)
    #   takeaway.place(order)
    #   expect
    # end
  end
end
