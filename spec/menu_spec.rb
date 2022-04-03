require_relative '../lib/menu'

describe Menu do
  let (:menu) { Menu.new }

  context 'on creating a menu' do

    it 'adds an empty array' do
      expect(menu.dishes).to be_empty
    end
  end

  context 'when adding to the menu' do

    before do
      @fake_dish = double ('fake dish')
      menu.add_dish(@fake_dish)
    end

    it 'the dish is added to the dishes array' do
      expect(menu.dishes).to eq ([@fake_dish])
    end

    it 'the list of dishes added can be viewed' do
      expect(menu.list_dishes).to eq ([@fake_dish])
    end
  end
end
