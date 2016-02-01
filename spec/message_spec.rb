require 'checkout_message'

describe CheckoutMessage do
  subject(:message) {described_class.new}
  let(:delivery_time) {Message::HOURS_UNTIL_DELIVERY}

  describe "#initialize" do

    it{is_expected.to respond_to(:time)}

    it 'is initialized with credentials from Dotenv' do
      expect(message.creds).to eq Dotenv.load
    end
  end

  describe "#time_delivery_expected" do

    it "adds an hour onto the time of ordering" do
      expect {message.time_delivery_expected}.to change(message, :time).by(CheckoutMessage::HOURS_UNTIL_DELIVERY * 360)
    end
  end

  describe '#send_sms' do

    xit "will send a message confirming order" do

    end

  end

end
