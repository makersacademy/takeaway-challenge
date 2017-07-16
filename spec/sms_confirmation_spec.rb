require 'sms_confirmation'

describe 'SmsConfirmation' do
  # let(:num) { 1234567890 }
  # let(:msg) { "Thank you! Your order was placed and will be delivered before #{Time.now + 3600}"}

  # it 'sends a text message via the Twilio API' do
  #   subject
  #   #fakesms = FakeSms.new(+441593362030, +1234567890, "Thank you!")
  #   expect(FakeSms.messages.last).to eq "Thank you! Your order was placed and will be delivered before #{Time.now + 3600}"
  # end

  # subject(:smsconfirmation) { described_class.new }
  it 'sends a delivery confirmation text message' do
    expect(subject).to receive(:send_text).with("Thank you! Your order was placed and will be delivered before #{Time.now + 3600}")
    subject.send_text("Thank you! Your order was placed and will be delivered before #{Time.now + 3600}")
  end

end
