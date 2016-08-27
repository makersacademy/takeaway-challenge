require 'dish'

describe Dish do

  let(:subject) { described_class.new(name: 'fries', price: 2.50) }

  describe '#name' do
    it 'knows it\'s name' do
      expect(subject.name).to eq 'fries'
    end
  end
  describe '#price' do
    it 'knows it\'s price' do
      expect(subject.price).to eq 2.5
    end
  end
end
