require 'order'

describe Order do

  let(:send_sms)  { double(:send_sms) }
  let(:menu)      { double(:menu, dish_list:
    {
          'chicken korma' => 5,
          'chicken bhuna' => 6,
          'lamb rogan josh' => 7,
          'plain rice' => 1,
          'pilau rice' => 2,
          'plain naan' => 3,
          'peshwari naan' => 4
        }
      )
    }

  let(:order)   { described_class.new(menu, send_sms) }

  before do
      allow($stdout).to receive(:write)
   end

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
      expect(order.menu).to eq menu
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
    it 'prints out the basket total' do
      order.add_dish('chicken korma')
      order.add_dish('plain naan')
      order.add_dish('pilau rice')
      expect(order.show_basket).to eq "Total: 10"
    end
  end

  describe '#confirm' do
      it 'allows users to confirm an order' do
      expect(order).to respond_to :confirm
    end

      it 'tells send sms to send a message' do
      allow(send_sms).to receive(:send).and_return("message sent")
      expect(order.confirm).to eq "message sent"
      order.confirm
    end
  end
end
