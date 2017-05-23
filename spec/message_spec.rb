require 'message'

describe Message do
  let (:account) { double(:twilio_account) }
  let(:messages) { double(:twilio_messages) }
  let(:client) { double(:twilio_client, account: account, messages: messages) }

  subject(:message) { described_class.new }    #(client) }

  describe '#send_message' do
    it 'calculates the expected arrival time of order (+ 30 minutes)' do
      time2 = Time.now + (30 * 60)
      message.send_message(20)
      expect(message.time_order).to eq time2.strftime("%H:%M")
    end
    # it '' do
    #   expect(client).to receive_message_chain(:create).with(body: "woop!", to: 0752321358, from: 035289253)
    #   message.send_message("woop!")
    # end
  end

end
