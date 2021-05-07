require 'Order.rb'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double() }

  context '#add_dish' do
    it 'stores selected dishes and quantities' do
      order.add_dish("Pizza", 2)
      expect(order.dishes).to include({ :name => "Pizza", :amount => 2 })
    end

    it 'raises an error if the dish isnt on the menu' do
      message = "This dish isn't available, please run menu.list_dishes to see the dishes"
      expect { order.add_dish("Potatoes", 1) }.to raise_error message 
    end
  end

  context '#total_price' do
      # As a customer
      # So that I can verify that my order is correct
      # I would like to check that the total I have been given matches the sum of the various dishes in my order
    it 'checks the total matches the sum of the dishes in an order' do
      order.add_dish("Pizza", 2)
      order.add_dish("Curry", 1)
      expect(order.total_price).to eq 13
    end
  end

  context '#confirmation_of_order' do
    it 'checks that a confirmation message is sent out after completing the order total' do
      order.add_dish("Pizza", 2)
      order.add_dish("Curry", 1)
      order.complete?
      expect { order.message }.not_to raise_error
    end
  end
end
