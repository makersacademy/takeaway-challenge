require 'menu_entry'

describe MenuEntry do
  
  subject(:menu_entry) { described_class.new }

  let(:dish) { double :dish }
  let(:price) { double :price }

  context 'when menu entry hash is created' do

    it 'empty on intialization' do
      expect(menu_entry.dish).to eq nil
      expect(menu_entry.price).to eq nil
    end

    it 'adds dish to menu_entry' do
      expect(menu_entry.add_dish(dish)).to eq dish
    end

    it 'adds price to menu_entry' do
      expect(menu_entry.add_price(price)).to eq price
    end
  end
end
