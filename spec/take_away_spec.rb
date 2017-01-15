require 'take_away'

describe TakeAway do

  subject(:take_away) { described_class.new }

  context 'class' do
    it 'creates instance of a class' do
      expect(take_away).to be_a(TakeAway)
    end
  end

  context 'read_menu' do
    it 'prints menu upon request' do
      # replace with doubles
      expect { take_away.read_menu }.to output.to_stdout
    end
  end

  context 'place_order_interface' do
    it { is_expected.to respond_to(:place_order_interface).with(0).arguments}
  end

  context 'place_order' do
    let(:order_hash) { double :order_hash }
    it { is_expected.to respond_to(:place_order).with(1).argument }
    it 'saves an order' do
      # Figure out how to test!
      # (customer.order).stub(:total) { "total" }
      # expect(customer.order).to eq("total")
    end
    it 'raises an error if menu hasn\'t been loaded' do
      message = "Can't place order without information about the order: please provide what you would like to order in acceptable format."
      expect {take_away.place_order(nil)}.to raise_error(message)
    end
  end

  context 'basket_summary' do
    it 'prints order upon request' do
      take_away.read_menu
      # write proper test later on
      order_hash = { 1 => 3, 6 => 2, 9 => 1}
      take_away.place_order(order_hash)
      expect { take_away.basket_summary }.to output.to_stdout
    end
    it 'raises an error if order was not ordered' do
      message = "Order can't be found: looks like it hasn't been placed yet. Please place the order first."
      expect { take_away.basket_summary }.to raise_error(message)
    end
  end

end
