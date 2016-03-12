require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:valid_dish) { {name: 'sushi', amount: 3, price: 7} }
  let(:invalid_dish) { {name: 'sandwitch', amount: 1} }

  describe '#show_menu' do
    it '0.0 shows a list of dishes available to order with price' do
      expect(menu.show_menu).to include('sushi: £7' && 'ramen: £12')
    end
  end

  describe '#price' do
    it '1.0 finds a price of each dish' do
      expect(menu.price(valid_dish)).to eq(valid_dish[:price])
    end
    it '1.1 raises an error if the dish is not included in the menu' do
      message = 'Choose dishes in the menu'
      expect{menu.price(invalid_dish)}.to raise_error message
    end
  end
end
