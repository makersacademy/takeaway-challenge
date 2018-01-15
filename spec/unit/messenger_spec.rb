require 'messenger'

describe Messenger do
  subject(:messenger) { described_class.new }

  describe '#confirm_order' do
    it 'allows messenger to send confirmation message' do
      delivery_time = (Time.now + 1800).strftime("%H:%M")
      message = "Thank you for your order. Your food will be delivered by #{delivery_time}"
      expect(messenger).to receive(:send_message).with(message)
      messenger.confirm_order
    end
  end
end
