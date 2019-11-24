require 'order_listing'

RSpec.describe OrderListing do
  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }
  let(:test_order_listing) { OrderListing.new(item_1) }
  let(:test_order_listing_2) { OrderListing.new(item_2, 2) }

  describe '#quantity' do
    it 'keeps track of the quantity of a dish a customer wishes to order' do
      test_order_listing.add_serving

      expect(test_order_listing.entry).to eq 'Pepperoni Pizza – Quantity: 2'
    end

    it 'decreases quantity when customer removes item from an order' do
      test_order_listing_2.remove_serving

      expect(test_order_listing_2.entry).to eq 'Margherita Pizza – Quantity: 1'
    end
  end
end
