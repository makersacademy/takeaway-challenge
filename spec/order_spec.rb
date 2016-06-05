require 'order'

describe Order do

  let(:menu) { double :menu, :data => {"Pilau Rice" => 2.20, "Pizza" => 5.50} }
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
      it 'displays a pretty printout'
      it 'accurately shows the totals of each item'
      it 'updates the amount of each item'
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
    		expect(order.total).to eq("£15.40")
    	end
    end
  end


end
