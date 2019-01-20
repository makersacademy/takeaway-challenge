require 'sms'

describe SMS do
  subject(:sms) { described_class.new(takeaway.receipt)}
  let(:takeaway) { double :takeaway, receipt: "Burger x1 £3.00"}

  describe '#new' do
    it 'Initializes with relevant variables assigned' do
      expect(sms.account_sid).to be_a String
      expect(sms.auth_token).to be_a String
      expect(sms.client).to be_a Twilio::REST::Client
      expect(sms.receipt).to eq "Burger x1 £3.00"
    end
  end

  describe '#send' do
    it 'Responds to the send command' do
    allow(sms).to receive(:send) { "Nothing sent" }
    expect(sms.send).to respond_to(:send)
    end
  end

  describe '#message_contents' do
    it 'Displays text information and to & from details' do
      allow(sms).to receive(:delivery_time) { "RIGHT NOW!" }
      expect(sms.message_contents).to eq({:body=>"Burger x1 £3.00 \n Thank you! Your order will be delivered before RIGHT NOW!", :from=>"Removed", :to=>"Removed"})
    end
  end

  # describe '#delivery_time' do
  #   it 'Returns the current time + 1 hour' do
  #     allow(Time).to receive(:now).and_return(Time.parse("12:00")
  #     expect(sms.delivery_time).to eq "13:00"
  #   end
  # end

end
