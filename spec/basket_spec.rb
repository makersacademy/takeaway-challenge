require 'basket'

describe Basket do
let(:subject) {described_class.new}
let(:dish_a) {double(:dish, price: '100')}
let(:dish_b) {double(:dish, price: '050')}

  describe '#initialize' do
    it 'starts with an emtpy array' do
      expect(subject.dishes).to be_an(Array)
      expect(subject.dishes).to be_empty
    end
  end

  describe '#add' do
    it 'adds something to its contents' do
      expect{subject.add(dish_a)}.to change {subject.dishes}.by [dish_a]
    end

  describe '#dishes'
    it 'stores multiple dishes' do
      subject.add(dish_a)
      subject.add(dish_b)
      expect(subject.dishes).to include(dish_a, dish_b)
    end
  end

  describe '#total' do
    before :example do
      subject.add(dish_a)
      subject.add(dish_b)
    end
    it 'gets the price from the items in the basket' do
      expect(dish_a).to receive(:price)
      subject.total
    end
    it 'returns the total of prices in the dishes array in a monetary format' do
      expect(subject.total).to eq '1.50'
    end
  end
end
