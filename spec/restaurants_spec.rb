require 'restaurants'

describe Restaurants do

  let(:menu_instance) { double() }
  let(:menu_class) { double(new: menu_instance) }

  let(:menu_item_instance) { double() }
  let(:menu_item_class) { double(new: menu_item_instance) }

  describe 'load_restaurants' do
    it 'returns a structured list of possible restaurants from a JSON file' do
      restaurants = [{"Italian" => {"Pizza" => "5.00", "Lasagne" => "10.50", "Gelato" => "3.90"}},
        {"Japanese"=>{"Sushi"=>"12.00", "Teriyaki"=>"32.20", "Rice"=>"1.70"}}]
      expect(subject.load_restaurants).to eq(restaurants)
    end
  end

  describe '#find_restaurants' do
    it 'populates itself with a list of restaurants' do
      subject = described_class.new(menu_class, menu_item_class)
      expect { subject.find_restaurants }.to change { subject.restaurants.length }.by(2)
    end
  end


  describe '#create_menu' do
    it 'has the menu name from menu object when creating from a hash' do
      resturant_hash = {"Italian":{"Pizza": "5.00", "Lasagne": "10.50", "Gelato": "3.90"}}
      subject.create_menu(resturant_hash)
      expect(subject.restaurants[0].name).to eq('Italian')
    end
    it 'has the dish name from menu object when creating from a hash' do
      resturant_hash = {"Italian":{"Pizza": "5.00", "Lasagne": "10.50", "Gelato": "3.90"}}
      subject = described_class.new(menu_class, menu_item_class)
      expect(subject.create_menu(resturant_hash)).to include(['Pizza', '5.00'],["Lasagne", "10.50"],["Gelato", "3.90"])
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
