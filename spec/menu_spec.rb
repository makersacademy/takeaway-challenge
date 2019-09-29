require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'initializes with some dishes' do
      expect(menu.available_dishes).to include({ name: "Pizza", price: 9 })
    end
  end

  describe '#add_item' do
    it 'adds a dish to the menu' do
      name = "Fish and Chips"
      price = 10
      menu.add_item(name, price)
      expect(menu.available_dishes).to include({ name: "Fish and Chips", price: 10 })
    end
  end

  describe '#show' do
    it 'shows the menu' do
      expect(menu).to respond_to(:print_menu)
    end
  end

end
