require_relative '../lib/menu'

describe Menu do
  let (:menu) { Menu.new }

  context 'when creating a menu' do

    it 'an empty array is created' do
      expect(menu.dishes).to be_empty
    end
  end

  context 'when adding to the menu' do

    before do
      @fake_dish = double('fake dish', name: 'pasta', price: 10)
      menu.add_dish(@fake_dish)      
    end

    it 'the dish is added to the dishes array' do
      expect(menu.dishes).to eq ([@fake_dish])
    end

    it 'the list of dishes added can be viewed' do
      expect do
        menu.list_dishes
      end.to output(a_string_including("pasta, £10")).to_stdout
    end
  end
end
