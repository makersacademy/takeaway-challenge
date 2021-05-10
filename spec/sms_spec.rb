require 'sms'

describe Sms do

  describe "#send" do
    let(:client) { double(Twilio::REST::Client) }
    it 'calls messages.create on the client' do
      expect(client).to receive_message_chain("messages.create")
      sms = Sms.new(client)
      sms.send
    end
  end

end
