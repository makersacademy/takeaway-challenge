require 'dish'

describe Dish do
  describe '#initialize' do
    it 'should save "id"' do
      dish = described_class.new(:pizza, 2)

      expect(dish.id).to eq(:Pizza)
    end

    it 'should save "price"' do
      dish = described_class.new(:pizza, 2)

      expect(dish.price).to eq(2)
    end
  end
end
