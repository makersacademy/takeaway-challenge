require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish }
  let(:price) { double :price }

  describe '#initialization' do
    it 'should create an empty menu array' do
      expect(menu.dishes).to_not be_empty
    end
  end

  describe '#contain_item?' do
    it 'should return true if dish exists' do
      expect(menu.contain_item?("Chicken")).to eq true
    end
  end

  describe '#dish_price' do
    it 'should return the price of an item' do
      allow(menu).to receive(:dishes).and_return ({dish => price})
      expect(menu.dish_price(dish)).to eq price
    end
  end


end
