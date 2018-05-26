require 'customer.rb'

describe Customer do 
  subject(:customer) { described_class.new }

  context "#view_menu:" do 
    it 'returns a list of items with prices ' do
      expect(customer.view_menu).to include("Chicken Curry, £9.99")
      expect(customer.view_menu).to include("Pork Belly, £7.99")
    end
  end

  context 'create_order' do 
    it 'allows a user to create an order' do
      expect { customer.create_order }.not_to raise_error
    end

    it 'tells the user that an order has been created' do
      expect(customer.create_order).to eq "You have created an order"
    end
  end

  context '#add_to_order' do
    it 'allows a user to add an item to the create_order' do
      order = customer.create_order
      order.add_to_order

    end
  end
end