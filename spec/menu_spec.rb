require 'menu'
describe Menu do
  subject(:menu) { described_class.new }

  describe '#dishes' do

    it 'returns a list of dishes and prices' do
      expect(menu.read).to eq(menu.dishes)
    end
  end

  describe '#dish_price' do
    it 'returns the price of a given dish' do
      dish = double :dish
      expect(menu.dish_price(dish)).to eq(menu.dishes[dish])
    end
  end
end
