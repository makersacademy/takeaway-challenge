require 'menu.rb'

describe Menu do

  describe 'initialize' do
    it 'creates an instance of menu' do
      menu = Menu.new
      expect( menu ).to be_a(Menu)
    end
  end

  describe '#add dish' do
    it 'adds to the menu' do
      menu = Menu.new
      dish = Dish.new('noodles', 5)
      expect(menu.add_dish(dish)).to eq([["Noodles", 5]])
    end
  end

  describe '#show_itmes' do
    menu = Menu.new
    dish = Dish.new('noodles', 5)
    menu.add_dish(dish)
    it 'displays the menu' do
      expect(menu.show_items).to eq([["Noodles", 5]])
    end
  end


end
