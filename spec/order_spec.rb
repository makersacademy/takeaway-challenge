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
      expect(subject.basket).to eq([{ :dish => dish, :price => price }])
    end

    it 'adds a given quantity of an item to their order' do
      allow(resturant).to receive(:menu).and_return(menu)
      subject.add(resturant, dish, 3)
      expect(subject.basket).to eq([{ :dish => dish, :price => price }, { :dish => dish, :price => price }, { :dish => dish, :price => price }])
    end
  end

  describe '#total' do
    it 'shows the total cost of the order' do
      allow(price).to receive(:to_i).and_return(1)
      allow(resturant).to receive(:menu).and_return(menu)
      subject.add(resturant, dish, 3)
      expect(subject.total).to eq 3
    end
  end

  describe '#complete_order' do
    it 'completes the order if that totals match' do
      allow(price).to receive(:to_i).and_return(1)
      allow(resturant).to receive(:menu).and_return(menu)
      subject.add(resturant, dish, 3)
      expect(subject.complete_order(3)).to eq("Your order has been placed")
    end

    it 'does not complete the order if that totals do not match' do
      allow(price).to receive(:to_i).and_return(1)
      allow(resturant).to receive(:menu).and_return(menu)
      subject.add(resturant, dish, 3)
      expect(subject.complete_order(2)).to eq("Your total does not match your order, please check again")
    end
  end
end
