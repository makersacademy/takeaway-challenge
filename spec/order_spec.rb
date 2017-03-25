require 'order'

describe Order do
  let(:item) {double(:item)}

  describe '#items' do
    it 'contains items initially' do
      expect(subject.items).not_to be_empty
    end
  end

  describe '#add' do
    it 'adds an item to the order' do
      subject.add(item)
      expect(subject.items).to include(item)
    end
  end
end
