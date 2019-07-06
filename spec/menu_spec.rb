require 'menu'
describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { :dish }
  let(:price) { :price }

  describe '#dishes' do

    it 'returns a list of dishes and prices' do
      allow(menu).to receive(:dishes).and_return([{ dish => price }])
      expect(menu.dishes).to eq([{ dish => price }])
    end
  end

  describe '#dish_price' do
    it 'returns the price of a given dish' do
      expect(menu.dish_price(dish)).to eq(menu.dishes[dish])
    end
  end
end
