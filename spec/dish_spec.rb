require 'dish'

describe Dish do

  dish_1 = "Chicken Teriyaki"
  price_1 = 6.95
  subject = described_class.new(dish_1, price_1)

  describe '#initialize' do

    it 'returns a name' do
      expect(subject.name).to eq dish_1
    end

    it 'returns a price' do
      expect(subject.price).to eq price_1
    end
  end

end
