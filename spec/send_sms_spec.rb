require 'send_sms'

describe 'SendSMS' do

  subject(:takeaway) { TakeAway.new }

  before do
    allow(takeaway).to receive(:sms)
  end

  # it { is_expected.to respond_to(:sms) }
  describe '#sms' do
    it 'sends a order confirmation text message' do
      expect(takeaway).to receive(:text).with("Thank you! Your order was placed and will be delivered at " + (Time.now + 3600).to_s)
      takeaway.text("Thank you! Your order was placed and will be delivered at " + (Time.now + 3600).to_s)
    end
  end

end
