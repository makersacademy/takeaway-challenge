require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let (:dish1) { double :dish1}
  let (:dish2) { double :dish2 }

  before do
    allow(dish1).to receive(:name).and_return('pizza')
    allow(dish1).to receive(:price).and_return(1.05)
  end

  describe '#see_menu' do

    it 'return error when menu is empty' do
      expect{menu.see_menu}.to raise_error 'Menu is empty'
    end

    it 'return list of dishes with price' do
      menu = Menu.new ([dish1, dish2])
      expect(menu.see_menu).to eq [dish1,dish2]
    end
  end

  describe '#add_dish' do
    it 'add dish to the menu' do
      menu.add_dish(dish1)
      expect(menu.menu_list).to include(dish1.name => dish1.price)
    end

    it 'raise error if trying to add existing dish' do
      menu.add_dish(dish1)
      message = "#{dish1.name} is already in the menu!"
      expect{menu.add_dish(dish1)}.to raise_error message
    end
  end
  describe '#remove_dish' do

    it 'remove dish from the menu' do
      menu.add_dish(dish1)
      menu.remove_dish(dish1)
      expect(menu.menu_list).not_to include(dish1.name => dish1.price)
    end

    it 'raise error if trying to delete not existing dish' do
      message = "#{dish1.name} is not in the menu!"
      expect{menu.remove_dish(dish1)}.to raise_error message
    end
  end

end