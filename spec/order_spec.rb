require 'order'

describe Order do

  let(:order)     { described_class.new }
  let(:send_sms)  { double(:send_sms)   }

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
      expect(order.basket).to eq [{"chicken korma"=>5}, {"plain naan"=>3}, {"pilau rice"=>2}]
    end
  end

  describe '#get_toal' do
    it 'totals up the prices' do
      order.add_dish('chicken korma')
      order.add_dish('plain naan')
      order.add_dish('pilau rice')
      expect(order.get_total).to eq 10
    end
  end

  # needs fixing...
  # describe '#confirm' do
  #
  #     before do
  #       allow(order).to receive(:send_message)
  #     end
  #
  #       it 'sends a message to confirm the order' do
  #         expect(order).to receive(:send_text).with("message sent")
  #         order.confirm
  #       end
  #
  #     end

  end
