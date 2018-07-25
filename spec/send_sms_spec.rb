require 'send_sms'

describe TextSender do

  let(:fake_text) { TextSender.new }
  let(:fake_client) { double :client, messages: [] }

  before do
    fake_text.instance_variable_set(:@client, fake_client)
  end

  describe "#send_text" do

    it "Sends a text to client using Twilio API" do

      expect(fake_client.messages).to receive(:create).with(
        from: '+447480538110',
        to: '+447587518687',
        body: "Thank you, your order has been placed! It should arrive before #{(Time.now + (60 * 60)).strftime('%R')}"
      )
      fake_text.send_text
      end
    end

end
