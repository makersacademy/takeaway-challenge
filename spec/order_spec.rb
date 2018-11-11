require 'order'

describe Order do

  let(:order) { described_class.new }

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

  describe '#confirm' do

    it 'asks for a user to confirm the delivery' do
      allow($stdin).to receive(:gets).and_return(10)
      input = $stdin.gets
      expect(input).to eq(10)
    end

    context 'user inputs incorrect payment' do
      xit 'cancels the order' do
        order.add_dish('chicken korma')
        order.add_dish('plain naan')
        order.add_dish('pilau rice')
        allow($stdin).to receive(:gets).and_return(3254)
        expect(order.confirm).to eq 'Sorry your order was cancelled!'
      end
    end

    context 'user has confirmed the order' do
      xit 'sends a message to confirm the order' do
        order.add_dish('chicken korma')
        order.add_dish('plain naan')
        order.add_dish('pilau rice')
        send_sms = double(:send_sms, send: 'message sent')
        expect(send_sms).to receive(:send) { 'message sent' }
        allow($stdin).to receive(:gets).and_return(10)
        expect { order.confirm }.to output("message sent").to_stdout
      end
    end

  end

end
