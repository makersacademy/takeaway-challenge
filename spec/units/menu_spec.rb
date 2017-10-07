require 'menu'

describe Menu do
  describe '#initialize' do
    it 'adds a Dish object to the menu.dishes array' do
      expect(subject.dishes[0]).to be_a Dish
    end
    it 'adds adds the right number of objects to the menu.dishes array' do
      expect(subject.dishes.length).to eq Menu::DISHES.length
    end
  end
  describe '#see' do
    it 'enables users to see everything on the menu' do
      menu_text = subject.see
      Menu::DISHES.each do |dish_array|
        expect(menu_text).to include dish_array[0]
      end
    end
  end
end
