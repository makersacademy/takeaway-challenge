require 'menu'

describe Menu do
  let(:item) { double :item }

  describe '#initialization' do
    it { expect(subject.items).to eq({}) }
  end

  describe '#add_item' do 
    it 'adds an item to the items array' do 
      allow(item).to receive(:new).with(any_args) { item }
      allow(item).to receive(:name) { :pizza }
      allow(item).to receive(:price) { 8 }
      subject.add_item(item, "pizza", 8)
      expect(subject.items).to include :pizza
    end
  end
end
