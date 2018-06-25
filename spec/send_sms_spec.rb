require 'send_sms'

# Don't know how to stub send method

describe Send_message do

let(:message) { described_class.new }
let(:send) {double :send }
let(:time) {double :time}

  describe "#send" do
    it "send a message" do
      allow(message).to receive(:send).with(:time).and_return("Thank you, your order was placed and should arrive at #{:time}")
      expect(message.send(:time)).to eq "Thank you, your order was placed and should arrive at #{:time}"
    end

    it "stored the environment variables" do
      # expect(message.account_sid).to eq('TWILIO_ACCOUNT_SID')
    end

  end


end
