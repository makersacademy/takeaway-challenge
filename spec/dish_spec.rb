require 'dish'

describe Dish do
  let(:name) { double :String }
  let(:price) { double :Integer }
  subject(:dish) { described_class.new(name: name, price: price) }

  describe '#initialize' do
    it 'initializes with a name' do
      expect(dish.name).to eq name
    end

    it 'initializes with a price' do
      expect(dish.price).to eq price
    end
  end
end
