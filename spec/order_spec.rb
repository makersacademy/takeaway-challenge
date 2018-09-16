require 'order'

describe Order do

  let(:item) { double :item }
  let(:price) { double :price }
  let(:menu3) { [{ :item => item, :price => price }] }

  describe '#add' do
    it 'allows a user to add an item to their order' do
      allow(menu3).to receive(:menu).and_return([{ :item => item, :price => price }])
      subject.add(menu3, item)
      expect(subject.order).to eq([{ :item => item, :price => price }])
    end
  end

end
