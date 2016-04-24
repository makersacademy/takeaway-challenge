require 'message'

describe Message do

  subject(:message) { described_class.new }
  let (:time) { (Time.new + 3600) }
  let (:message_body) { "Thank you! Your order will be delivered before #{time.strftime("%H:%M")}!" }

  describe '#send' do

    # it 'sends a message confirming the order and that it will be delivered within one hour' do
    #   allow(message).to receive(:send).with(time)
    #   expect(message.send).to eq message body
    # end

    # it 'calls twilio_send' do
    #   expect(message).to receive(:send(time)).with(message_body)
    #   message.send(message_body)
    # end

end
end
