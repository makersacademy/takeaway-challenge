require 'menu'

describe Menu do
  describe '#initialize' do
    it 'creates an empty array called selection' do
      expect(subject.selection).to eq []
    end
    it 'adds a Dish object to the menu.dishes array' do
      expect(subject.dishes[0]).to be_a Dish
    end
    it 'adds adds the right number of objects to the menu.dishes array' do
      expect(subject.dishes.length).to eq Menu::DISHES.length
    end
  end
  describe '#see' do
    it 'enables users to see everything on the menu' do
      menu_text = subject.menuprinter.see subject.dishes
      Menu::DISHES.each do |dish_array|
        expect(menu_text).to include dish_array[0]
      end
    end
  end
  describe '#select' do
    it 'enables users to choose an item on the menu and save it to the selection array' do
      subject.select 'Pizza Diavola', 1
      expect(subject.selection[0].name).to eq 'Pizza Diavola'
    end
    it 'enables users to choose a particular number of items' do
      subject.select 'Pizza Diavola', 3
      expect(subject.selection[0].quantity).to eq 3
    end
    it 'tells a user if they are trying to order something that is not available' do
      expect(subject.select 'Pizza Napolitana', 1).to eq 'Sorry, that is not available'
    end
    it 'enables users to add muliples items' do
      subject.select 'Pizza Diavola', 3
      subject.select 'Tagliatelle with duck ragu', 1
      subject.select 'Salad Caprese', 2
      expect(subject.selection.length).to eq 3
    end
  end
end
