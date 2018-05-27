require './lib/restaurant.rb'

describe Restaurant do

  subject(:restaurant) { described_class.new }

  context 'default #initialization' do
    it 'can create a new instance of a Restaurant' do
      expect { Restaurant.new }.not_to raise_error
    end

    it 'contains an array of hashes for the menu structure' do
      expect(restaurant.dishes).to include({ "Chicken Tikka" => 8.99 })
    end

    it 'contains an array of hashes for the menu structure' do
      expect(restaurant.dishes).to include({ "Dry Meat" => 10.99 })
    end
  end

  context '#dishes' do
    it 'contains a list of dishes with prices on initialization' do
      expect(restaurant.dishes).to include({ "Chicken Tikka" => 8.99 })
      expect(restaurant.dishes).to include({ "Dry Meat" => 10.99 })
      expect(restaurant.dishes).to include({ "Garlic Naan" => 3.49 })
    end
  end

end
