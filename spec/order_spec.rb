require 'order'

describe Order do

  let(:menu) { double :menu, :dishes => {"Pilau Rice" => 2.20, "Pizza" => 5.50} }
  subject(:order) { described_class.new(menu) }

  describe 'responses' do
    it { is_expected.to respond_to(:add).with(1).argument }
    it { is_expected.to respond_to(:basket) }
    it { is_expected.to respond_to(:view_basket) }
    it { is_expected.to respond_to(:total) }
  end

  describe '#add' do
    context 'when items aren\'t valid' do
      it 'raises an error' do
        expect{order.add('A Goat')}.to raise_error("That dish isn't on the menu, please try again.")
      end
    end
    context 'when items are valid' do
      it 'should add items to the basket' do
        expect(order.add('Pizza')).to eq("1x Pizza, £5.50 - added to your basket")
      end
      it 'the item is added to the basket' do
        order.add('Pizza')
        order.add('Pizza')
        expect(order.basket).to eq(["Pizza", "Pizza"])
      end
    end

  end

  describe '#basket' do

    context 'when empty' do
      it 'raises error' do
        expect{order.basket}.to raise_error("Nothing in basket")
      end
    end
    context 'when has contents' do
      it 'stores a sorted array of items' do
        order.add('Pizza')
        order.add('Pilau Rice')
        order.add('Pizza')
        order.add('Pilau Rice')
        expect(order.basket).to eq(["Pilau Rice","Pilau Rice","Pizza","Pizza"])
      end
    end
  end

  describe '#view_basket' do
    context 'when empty' do
      it 'raises error' do
        expect{order.basket}.to raise_error("Nothing in basket")
      end
    end
    context 'when not empty' do
      it 'prints out formatted results' do
        order.add('Pizza')
        order.add('Pizza')
        expect(order.view_basket).to eq("2x Pizza, £11.00\n")
      end
      it 'prints out multi lines' do
        order.add('Pizza')
        order.add('Pizza')
        order.add('Pilau Rice')
        expect(order.view_basket).to eq("2x Pizza, £11.00\n1x Pilau Rice, £2.20\n")
      end
    end
  end

  describe '#total' do
    context 'when no items in basket' do
      it 'raises an error' do
        expect{order.total}.to raise_error("Nothing in basket")
      end
    end
    context 'when items are in basket' do
      it 'shows an accurate total' do
        order.add('Pizza')
        order.add('Pilau Rice')
        order.add('Pizza')
        order.add('Pilau Rice')
        expect(order.total).to eq("Total: £15.40")
      end
    end
  end

  describe '#checkout' do
    context 'when basket empty' do
      it 'raises an error' do
        expect{order.checkout}.to raise_error("Nothing in basket")
      end
    end
    context 'when basket has items' do
      it 'confirms order' do
        order.add('Pizza')
        order.add('Pilau Rice')
        order.add('Pizza')
        order.add('Pilau Rice')
        expect(order.checkout).to eq("Order received, Total: £15.40")
      end
      it 'resets the basket' do
		order.add('Pizza')
        order.add('Pilau Rice')
        order.checkout
      	expect{order.basket}.to raise_error("Nothing in basket")
      end
    end
  end


end
