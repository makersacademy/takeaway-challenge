require 'checkout_message'

describe CheckoutMessage do
  subject(:message) {described_class.new}
  let(:delivery_time) {CheckoutMessage::HOURS_UNTIL_DELIVERY}
  let(:sample_message) {double :sample_message}

  describe "#initialize" do

    it{is_expected.to respond_to(:time)}

    it 'is initialized with credentials from Dotenv' do
      expect(message.creds).to eq Dotenv.load
    end
    
  end

  describe "#time_delivery_expected" do

    it "adds an hour onto the time of ordering" do
      time = Time.new
      time += 3600 * delivery_time
      p time
      expect(message.time_delivery_expected).to eq(time.strftime "%H:%M")
    end

  end
end
