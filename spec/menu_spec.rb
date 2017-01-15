require 'menu.rb'

describe Menu do
  menu1 = Menu.new

  describe 'initialize' do
    it 'creates an instance of menu' do
      expect( menu1 ).to be_a(Menu)
    end
  end

  describe '#add dish' do
    dish1 = Dish.new('noodles', 5)
    it 'adds to the menu' do
      expect(menu1.add_dish(dish1)).to eq([["Noodles", 5]])
    end
  end

  describe '#show_itmes' do
    menu1.add_dish(dish1)
    dish2 = Dish.new('dumplings', 5)
    menu1.add_dish(dish2)
    it 'displays the menu' do
      expect(menu.show_itmes)
    end
  end


end
