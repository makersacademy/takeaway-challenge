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
  describe '#readable_menu' do
    it 'returns a string' do
      expect(subject.readable_menu).to be_a String
    end
    it 'which contains the name of the dish' do
      expect(subject.readable_menu).to include name
    end
    it 'and the price of the dish' do
      expect(subject.readable_menu).to include price.to_s
    end
  end
  describe '#readable_order' do
    it 'returns a string' do
      expect(subject.readable_order).to be_a String
    end
    it 'which contains the name of the dish' do
      expect(subject.readable_order).to include name
    end
    it 'and the price of the number of dishes ordered' do
      dish.quantity_ordered = 3
      expect(subject.readable_order).to include (price * 3).to_s
    end
  end
end
