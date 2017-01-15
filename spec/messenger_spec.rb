require 'messenger'
# require 'twilio-ruby'

describe Messenger do
  subject(:messenger) {described_class.New}
  before(:each) do
    allow(takeaway).to receive (:send_message)

    it {is_expected.to respond_to(:send_message).with(1).argument}

    it "sends a SMS message to the user confirming that their order has been placed and confirming the time it will be ready" do
      delivery_time = (Time.now + (60*60)).strftime("%H:%M")
      expect(messenger).to receive(:send_message).with("Thank you! Your order was placed and will be delivered before #{delivery_time}")
      takeaway.confirm_order
    end
  end
end
