require 'dish'

describe Dish do

  # Dishes
  let(:subject) { described_class.new(:Double_trouble, 12.99) }

  describe '#initialize' do
    it 'has a price' do
      expect(subject.price).to eq 12.99
    end

    it 'has a name' do
      expect(subject.name).to eq :Double_trouble
    end
  end
end
