require './lib/menu.rb'

describe Menu do
  let(:menu) { described_class.new }

  describe '#initialize' do
    it 'is initialized with dishes' do
      complete_menu = { :starters => { "Olives" => 4, "Pitta bread" => 5 }, :main_course => { "Fried duck" => 12, "Fish & Chips" => 9 }, :dessert => { "Jam roll" => 5, "Apple crumble" => 6 } }
      expect(menu.dishes).to eq complete_menu
    end
  end

  describe '#lists_dishes_with_prices' do
    it 'lists all menu dishes with prices' do
      all_dishes = "Starters: Olives = £4, Pitta bread = £5 -- Main Course: Fried duck = £12, Fish & Chips = £9 -- Dessert: Jam roll = £5, Apple crumble = £6."
      expect(menu.lists_dishes_with_prices).to eq all_dishes
    end
  end

end
