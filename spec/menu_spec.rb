require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { double :dishes }
  # let(:price) { double :price }

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
end
