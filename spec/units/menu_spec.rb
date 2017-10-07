require 'menu'

describe Menu do
  describe '#initialize' do
    it 'stores an empty array in a dishes instance variable' do
      expect(subject.dishes).to eq []
    end
  end
  describe '#build' do
    it 'adds a Dish object to the menu.dishes array' do
      subject.build
      expect(subject.dishes[0]).to be_a Dish
    end
    it 'adds adds the right number of objects to the menu.dishes array' do
      subject.build
      expect(subject.dishes.length).to eq Menu::DISHES.length
    end
  end
  context 'with dishes array built' do
    before(:each) {subject.build}
    describe '#see' do
      it 'enables users to see everything on the menu' do
        menu_text = subject.see
        Menu::DISHES.each do |dish_array|
          expect(menu_text).to include dish_array[0]
        end
      end
    end
  end
end
