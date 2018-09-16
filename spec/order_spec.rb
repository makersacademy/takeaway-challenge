require 'order'

describe Order do

  let(:dish) { double :dish }
  let(:price) { double :price }
  let(:resturant) { double :resturant }
  let(:menu) { [{ :dish => dish, :price => price }] }

  describe '#add' do
    it 'allows a user to add an item to their order' do
      allow(resturant).to receive(:menu).and_return(menu)
      subject.add(resturant, dish, 1)
      expect(subject.order).to eq([{ :dish => dish, :price => price }])
    end
  end

end
