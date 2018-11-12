require 'order'

describe Order do

  let(:order)   { described_class.new }
  let(:send_sms){ double(:send_sms) }

  describe '#initialize' do
    it 'creates an empty shopping basket' do
      expect(order.basket).to be_empty
    end

    it 'creates an empty price list' do
      expect(order.price_store).to be_empty
    end

    it 'creates a deafult total of 0' do
      expect(order.total).to eq Order::DEFAULT_TOTAL
    end

    it 'adds the menu to the order' do
      expect(order.menu).to be_an_instance_of Menu
    end
  end

  describe '#add_dish' do
    it 'allows user to add dish to basket' do
      order.add_dish('chicken korma')
      order.add_dish('plain naan')
      order.add_dish('pilau rice')
      expect(order.basket).to eq [{ "chicken korma" => 5 }, { "plain naan" => 3 }, { "pilau rice" => 2 }]
    end
  end

  describe '#show_basket' do
    it 'prints out the basket' do
      order.add_dish('chicken korma')
      order.add_dish('plain naan')
      order.add_dish('pilau rice')
      allow(order.show_basket).to receive(:puts)
      expect(order.show_basket).to eq "Total: 10"
    end
  end

  describe '#finalise_total' do
    it 'totals up the prices' do
      order.add_dish('chicken korma')
      order.add_dish('plain naan')
      order.add_dish('pilau rice')
      expect(order.finalise_total).to eq 10
    end
  end

    describe '#confirm' do
        it 'allows users to confirm an order' do
        expect(order).to respond_to :confirm
      end
        it 'tells send sms to send a message' do
        allow(order).to receive(:confirm)
        expect(send_sms).to respond_to(:send)
        order.confirm
      end
    end

  end
