require 'dish'

describe Dish do
  subject(:dish) { described_class.new('Pizza', 12) }
  
  describe '#name' do
    it 'returns the stored name' do
      expect(dish.name).to eq 'Pizza'
    end
  end
  
  describe '#price' do
    it 'returns the stored price' do
      expect(dish.price).to eq 12
    end
  end

  describe '#available?' do
    it 'defaults to true' do
      expect(dish.available?).to be true
    end
  end
end