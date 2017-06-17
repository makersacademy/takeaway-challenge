require 'menu'

describe 'Feature Tests' do
  let(:burger)  { Dish.new(title: 'Horse Burger', price: 7.99) }
  let(:steak)   { Dish.new(title: 'Horse Steak', price: 14.99) }
  let(:cutlets) { Dish.new(title: 'Horse Cutlets', price: 10.99) }
  let(:menu)    { Menu.new }

  describe 'Adding items to the menu' do
    before do
      menu.add(burger)
      menu.add(steak)
      menu.add(cutlets)
    end

    it 'shows the contents of the menu' do
      expect { menu.view }.to output("#{burger.title}: #{burger.price}\n#{steak.title}: #{steak.price}\n#{cutlets.title}: #{cutlets.price}\n").to_stdout
    end
  end
end
