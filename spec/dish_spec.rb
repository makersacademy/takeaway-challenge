require 'dish'

describe Dish do
  let(:id)        { 'CH' }
  let(:name)      { 'Cheeseburger' }
  let(:price)     { 42 }
  subject(:dish)  { described_class.new(name: name, price: price, id: id) }

  describe '#id' do
    it 'is expected to return dish ID' do
      expect(dish.id).to eq id
    end
  end

  describe '#name' do
    it 'is expected to return dish name' do
      expect(dish.name).to eq name
    end
  end

  describe '#price' do
    it 'is expected to return dish price' do
      expect(dish.price).to eq price
    end
  end
end
