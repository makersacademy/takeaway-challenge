require 'basket'

describe Basket do
  subject(:basket) { described_class.new }

  context 'when initialized' do
    it 'is empty' do
      expect(subject.contents).to be_empty
    end
  end

  describe '#add' do
    it 'adds an item to the basket' do
      item = double(:item)
      subject.add(item)
      expect(subject.contents.count(item)).to eq 1
    end
  end

  describe '#remove' do
    it 'raises an error if the item is not in the basket' do
      item = double(:item)
      expect { subject.remove(item) }.to raise_error "Couldn't remove item: it was not in the basket."
    end

    it 'removes an item from the basket' do
      item = double(:item)
      3.times { subject.add(item) }
      subject.remove(item)
      expect(subject.contents.count(item)).to eq 2
    end
  end

  describe '#total' do
    it 'returns the total value of the basket' do
      subject.add({price: 2})
      subject.add({price: 7})
      subject.add({price: 1})
      expect(subject.total).to eq 10
    end
  end
end