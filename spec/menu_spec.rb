require './lib/menu.rb'

describe Menu do
  let(:menu) { described_class.new(:dishes, :prices) }

  describe '#initialize' do
    it 'is initialized with dishes' do
      expect(menu.dishes).to eq :dishes
    end

    it 'is initialized with prices' do
      expect(menu.prices).to eq :prices
    end
  end

  describe '#list_dishes' do
    it 'lists dishes' do
      complete_menu = { :Starters => ["Olives", "Pitta bread,"], :Main_course => ["Fried duck", "Fish & Chips"], :Dessert => ["Jam roll", "Apple crumble"] }
      expect(menu.list_dishes).to eq complete_menu
    end
  end

  describe '#list_prices' do
    it 'lists prices' do
      complete_prices = { :Starters => [4, 5], :Main_course => [12, 9], :Dessert => [5, 6] }
      expect(menu.list_prices).to eq complete_prices
    end
  end
end
