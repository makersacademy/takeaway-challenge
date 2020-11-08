require 'order'

describe Order do
  describe '#add' do
    it 'adds a menu item to the basket hash' do
      expect { subject.add('curry goat', 1) }.to change { subject.basket.length }.by(1)
    end
  end

  describe '#basket' do
    it 'returns a counter hash of all items in the basket' do
      subject.add('beef patty', 1)
      3.times { subject.add('fried dumpling', 5) }
      expect(subject.basket[:'fried dumpling']).to eq(15)
    end
  end
end