require 'ordered_dish'

describe OrderedDish do
  name = 'Salad Caprese'
  price = 8.5
  quantity_ordered = 3
  subject(:dish) { described_class.new name, price, quantity_ordered }
  describe '#readable' do
    it 'returns a string' do
      expect(subject.readable).to be_a String
    end
    it 'which contains the name of the dish' do
      expect(subject.readable).to include name
    end
    it 'and the price of the number of dishes ordered' do
      expect(subject.readable).to include((price * 3).to_s)
    end
  end
end
