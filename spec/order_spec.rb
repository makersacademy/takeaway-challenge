require 'order'

describe Order do
  subject { described_class.new }

  before do
    subject.add("pasta", 8.9, 3)
    subject.add("pasta", 8.9, 1)
    subject.add("pizza", 6.5, 2)
  end

  describe '#add' do

    it 'Should print the right quantity for each ordered dish' do
      expect(subject.basket).to eq({ 'pasta' => 4, 'pizza' => 2 })
    end

    it 'Should print all the prices' do
      expect(subject.prices).to eq([26.7, 8.9, 13])
    end

  end

  describe '#sum' do
    it 'Should print out the sum of the prices' do
      expect(subject.sum).to eq 48.6
    end
  end
end
