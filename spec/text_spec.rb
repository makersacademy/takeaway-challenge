require 'timecop'
require 'text'
require 'twilio_mock'
require 'twilio-ruby'

describe Text do

  let(:client) { double :client }
  subject(:text) { described_class.new }

  it "creates an instance of the class" do
    expect(subject). to be_instance_of(Text)
  end

  describe "#send_message" do
    it 'creates a new message' do
      Timecop.freeze(Time.parse("19:00")) do
        twilio_messages = double(:twilio_messages)
        expect(Twilio::REST::Client).to receive(:new).with(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']).and_return(client)
        expect(client).to receive(:messages).and_return(twilio_messages)
        expect(twilio_messages).to receive(:create).with(
          body: "Thank you! Your order was placed and will be delivered before 20:00", 
          to: ENV['CUST_NUMBER'], 
          from: ENV['TWILIO_NUMBER']
        ).and_return(true)
        text.send_message
      end
    end
  end

  describe "#delivery_time" do
    it "returns delivery time - current time plus 1 hour" do
      Timecop.freeze(Time.parse("13:00")) do
        expect(text.delivery_time).to eq("14:00")
      end
    end
  end

end