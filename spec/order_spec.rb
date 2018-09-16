require 'order'

describe Order do

  let(:dish) { double :dish }
  let(:price) { double :price }
  let(:menu) { [{ :dish => dish, :price => price }] }

  describe '#add' do
    it 'allows a user to add an item to their order' do
      allow(menu).to receive(:menu).and_return([{ :dish => dish, :price => price }])
      subject.add(menu, dish)
      expect(subject.order).to eq([{ :dish => dish, :price => price }])
    end
  end

end
