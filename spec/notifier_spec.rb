require 'twilio-ruby'
require 'dotenv'
require 'notifier'

Dotenv.load

describe Notifier do
  subject(:notifier) { described_class.new }
  let(:client) { double(:client) }
  let(:sms_args) { {from: ENV['TWILIO_NUMBER'], to: ENV['MY_NUMBER'], body: msg} }
  let(:msg) { msg = "Thank you!. Your order was placed and will be delivered before 21:50" }
  
  describe "#send_sms" do
    it "sends a predefined sms after placing the order" do
      allow(Time).to receive(:now).and_return(Time.parse("20:50"))
      allow(client).to receive_message_chain(:account, :messages, :create).with(sms_args)
      expect(Twilio::REST::Client).to receive(:new).with(ENV['SID'], ENV['TOKEN']).and_return client
      notifier.send_sms
    end
  end
end