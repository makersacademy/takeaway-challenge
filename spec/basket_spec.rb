require 'basket'

describe Basket do
let(:subject) {described_class.new}
let(:dish) {double(:dish)}
  describe '#initialize' do
    it 'starts empty' do
      expect(subject.dishes).to be_empty
    end
  end

  describe '#add' do
    it 'adds something to its contents' do
      expect{subject.add(dish)}.to change {subject.dishes}.by [dish]
    end
  end
end
