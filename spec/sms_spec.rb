require_relative '../lib/sms'
require 'time'

describe SMS do
    subject(:text) { described_class.new(config, client) }
  
    let(:client) { double(:client, messages: messages) }
    let(:messages) { spy(:messages) }
  
    let(:config) do
      {
        account_sid: "123",
        auth_token: "23fds",
        from: "+123",
        to: "+234",
        body: "Thank you! Your order will be delivered before %s"
      }
    end
  
    it "delivers an SMS with the estimated time" do
      args = {
        from: config[:from],
        to: config[:to],
        body: "Thank you! Your order will be delivered before 19:00"
      }
  
      allow(Time).to receive(:now).and_return(Time.parse("18:00"))
      text.send_message
      expect(messages).to have_received(:create).with(args)
    end
  end