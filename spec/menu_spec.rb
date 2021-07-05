require 'menu'
require 'menu_entry'

describe Menu do

  subject(:menu) { described_class.new }

  let(:dish) { double :dish }
  let(:price) { double :price }
  let(:entry) { { dish: dish, price: price } }

  context 'when menu array is created' do
    it 'empty on initialization' do
      expect(menu.menu).to be_empty
    end
  end

  context 'when a new menu_entry hash is created' do

    it 'add to menu array' do
      menu_entry = MenuEntry.new
      menu_entry.add_dish(dish)
      menu_entry.add_price(price)
      expect(menu.add_entry(menu_entry)).to eq [entry]
    end
  end
end
