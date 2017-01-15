require 'take_away'

describe TakeAway do

  subject(:take_away) { described_class.new }

  describe 'class' do
    it 'creates an instance of a class' do
      expect(take_away).to be_a(TakeAway)
    end
  end

  describe '#read_menu' do
    it 'prints menu upon request' do
      expect { take_away.read_menu }.to output.to_stdout
    end
  end

  describe '#add_to_order' do
    it 'stores added items to order_hash' do
      expect {take_away.add_to_order(1,1)}.to change{take_away.order_hash.length}.by(1)
    end
    it 'prints items that were added to the order' do
      expect { take_away.read_menu }.to output.to_stdout
    end
  end

  # context 'place_order_interface' do
  #   it { is_expected.to respond_to(:place_order_interface).with(0).arguments}
  # end

  describe '#place_order' do
    let(:order_hash) { double :order_hash }
    let (:message) { double :message }
    it { is_expected.to respond_to(:place_order).with(1).argument }
    it 'saves an order' do
      # Figure out how to test!
      # (take_away.order).stub(:total) { "total" }
      # expect(customer.order).to eq("total")
    end
    context 'when trying to place order without info about order' do
      it 'raises an error' do
        allow(message).to receive(:send_sms).and_return(true)
        message = "Can't place order without information about the order: please provide what you would like to order in acceptable format."
        expect {take_away.place_order(nil)}.to raise_error(message)
      end
    end
  end

  describe '#order_details' do
    let(:order_hash) { { 1 => 3, 6 => 2, 9 => 1} }
    let (:message) { double :message }
    it 'prints order upon request' do
      allow(message).to receive(:send_sms).and_return(true)
      take_away.place_order(order_hash)
      expect { take_away.order_details }.to output.to_stdout
    end
    context 'if order was not placed' do
      it 'raises an error ' do
        message = "Order can't be found: looks like it hasn't been placed yet. Please place the order first."
        expect { take_away.order_details }.to raise_error(message)
      end
    end
  end

end
