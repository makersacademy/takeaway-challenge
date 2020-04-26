require 'restaurants'

describe Restaurants do
  it 'populates itself with a list of restaurants' do
    expect { subject.find_restaurants }.to change { subject.restaurants.length }.by(1)
  end

  describe '#create_menu' do
    it 'has the menu name from menu object when creating from a hash' do
      resturant_hash = {"Italian":{"Pizza": "5.00", "Lasagne": "10.50", "Gelato": "3.90"}}
      expect(subject.create_menu(resturant_hash).name).to eq('Italian')
    end
    it 'has the dish name from menu object when creating from a hash' do
      resturant_hash = {"Italian":{"Pizza": "5.00", "Lasagne": "10.50", "Gelato": "3.90"}}
      expect(subject.create_menu(resturant_hash).items[0].name).to eq('Pizza')
    end
  end
end
