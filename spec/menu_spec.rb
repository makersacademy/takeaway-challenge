require 'menu'

describe Menu do
  let(:item) { double(:item, name: :pizza, price: 8) }

  describe '#initialization' do
    it { expect(subject.items).to eq({}) }
  end

  describe '#add_item' do 
    it 'adds an item to the items array' do 
      allow(item).to receive(:new).with(any_args) { item }
      subject.add_item("pizza", 8)
      expect(subject.items).to include :pizza
    end
  end
end
