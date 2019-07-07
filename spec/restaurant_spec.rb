require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }
  
  describe '#add_to_menu' do
    it 'adds to the items on the restaurant menu' do 
        expect(restaurant.add_to_menu("banana", 1)).to eq [{"banana" => 1}]
    end
  end

  describe '#list_menu' do
    it 'lists the contents of the menu' do
      restaurant.add_to_menu("burger", 9)
      restaurant.add_to_menu("chips", 3)
      expect(restaurant.list_menu).to eq [{"burger"=>9}, {"chips"=>3}]
    end
  end

  describe '#select_meal' do
    it 'allows a customer to order from the menu' do
      restaurant.add_to_menu("burger", 9)
      restaurant.add_to_menu("chips", 3)
      expect(restaurant.select_meal(2)).to eq [{"chips"=>3}]
    end
  end

  describe '#request_receipt' do
    it 'generates a receipt for the customer and verifies that their meal is correct' do
      restaurant.add_to_menu("burger", 9)
      restaurant.add_to_menu("chips", 3)
      restaurant.select_meal(2)
      restaurant.select_meal(2)
      expect(restaurant.request_receipt).to eq "Order complete. Total cost: £6"
    end

    it 'generates a receipt for the customer and verifies that their meal is correct' do
      restaurant.add_to_menu("steak", 18)
      restaurant.add_to_menu("wine", 34)
      restaurant.select_meal(1)
      restaurant.select_meal(2)
      expect(restaurant.request_receipt).to eq "Order complete. Total cost: £52"
    end
  end

  describe '#start_order' do
    it 'starts a new order for a customer' do
      expect(restaurant.start_order).to eq "Select your meal"
    end
  end
end


