require 'menu'

describe Menu do
  describe '#initialize' do
    it 'stores an empty array in a dishes instance variable' do
      expect(subject.dishes).to eq []
    end
  end
  describe '#see' do
    it 'enables users to see the menu' do
      expect(subject.see).to be_an Array
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
end
