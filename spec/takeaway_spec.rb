require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, show: shown_menu, includes_dish?: true, price: 7.95) }
  let(:basket) { double(:basket, add: nil, show: basket_content, total: 10) }
  let(:client) { double(:client) }
  let(:message) { double :message }
  let(:messages_client) { double :messages_client }

  let(:confirmation) { TextConfirmation.new(client) }
  let(:shown_menu) { 'Dosa - £7.95' }
  let(:basket_content) { "3 x Dosa - £15.90\n2 x Chapatti - £5.40\n" }

  subject(:takeaway) { described_class.new(confirmation, menu, basket) }

  describe '#show_menu' do
    it 'returns a list of dishes and their prices' do
      expect(takeaway.show_menu).to eq shown_menu
    end
  end

  describe '#order' do
    it 'send selected dish, amount and price to basket' do
      allow(menu).to receive(:includes_dish?).and_return true
      expect(basket).to receive(:add).with 'Dosa', 3, 7.95
      takeaway.order('Dosa', 3)
    end

    it 'confirms the order with the user' do
      allow(menu).to receive(:includes_dish?).and_return true
      expect(takeaway.order('Dosa', 5)).to eq "Added 5 x Dosa to your order"
    end

    context 'dish is not on the menu' do
      it 'raises an error' do
        allow(menu).to receive(:includes_dish?).and_return false
        expect { takeaway.order('Pizza') }.to raise_error 'Cannot process order: that dish is not on the menu'
      end
    end
  end

  describe '#show_basket' do
    it 'returns all ordered dishes with the sum of their prices' do
      takeaway.order('Dosa', 3)
      takeaway.order('Chapatti', 2)
      expect(takeaway.show_basket).to eq basket_content
    end
  end

  describe '#checkout' do
    context 'if amount is correct' do
      it 'returns a message' do
        time = Time.new
        amount = 10
        message_config = { from: TextConfirmation::CONFIGURATION[:from], to: ENV['MY_PHONE_NUMBER'], body: "Thank you for your order.
Total order price: £#{amount}.
Expected delivery time: #{time.hour + 1}:#{time.min}." }
        allow(client).to receive(:messages).and_return messages_client
        allow(messages_client).to receive(:create).with(message_config).and_return message
        expect(takeaway.checkout(amount)).to eq message
      end
    end

    context 'if amount is incorrect' do
      it 'raises an error' do
        takeaway.order('Dosa', 3)
        takeaway.order('Chapatti', 2)
        expect { takeaway.checkout(5) }.to raise_error 'failed to check out: incorrect amount'
      end
    end
  end
end
