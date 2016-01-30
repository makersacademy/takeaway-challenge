require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let (:dish1) { double :dish1}
  let (:dish2) { double :dish2 }

  before do
    allow(dish1).to receive(:name).and_return('dish1')
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

  it 'add dish to the menu' do
    menu.add_dish(dish1)
    expect(menu.menu_list).to include(dish1.name => dish1.price)
  end

  it 'remove dish from the menu' do
    menu.add_dish(dish1)
    menu.remove_dish(dish1)
    expect(menu.menu_list).not_to include(dish1.name => dish1.price)
  end

end