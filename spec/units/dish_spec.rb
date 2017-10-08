require 'dish'

describe Dish do
  name = 'Salad Caprese'
  price = 8.5
  subject(:dish) { described_class.new name, price }
  describe '#initialize' do
    it 'gives the instance a name' do
      expect(dish.name).to eq 'Salad Caprese'
    end
    it 'gives the instance a price' do
      expect(dish.price_per_unit).to eq price
    end
    it 'gives the instance an order quantity that defaults to zero' do
      expect(dish.quantity_ordered).to eq 0
    end
  end
end
