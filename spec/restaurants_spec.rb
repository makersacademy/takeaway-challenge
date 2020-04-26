require 'restaurants'

describe Restaurants do

  describe 'load_restaurants' do
    it 'returns a structured list of possible restaurants from a JSON file' do
      restaurants = [{"Italian" => {"Pizza" => "5.00", "Lasagne" => "10.50", "Gelato" => "3.90"}},
        {"Japanese"=>{"Sushi"=>"12.00", "Terikyaki"=>"32.20", "Rice"=>"1.70"}}]
      expect(subject.load_restaurants).to eq(restaurants)
    end
  end

  describe '#find_restaurants' do
    it 'populates itself with a list of restaurants' do
      expect { subject.find_restaurants }.to change { subject.restaurants.length }.by(2)
    end
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

  describe '#search_for' do
    it 'searches for a menu by name' do
      subject.load_restaurants
      subject.find_restaurants
      expect(subject.search_for('Italian').name).to eq('Italian')
    end
    it 'raises an error if menu does not exist' do
      subject.load_restaurants
      subject.find_restaurants
      expect { subject.search_for('Mexican') }.to raise_error('Restaurant not found')
    end
  end
end
