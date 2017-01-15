require 'send_sms'

describe SMS do
  it 'requires 4 arguments to be passed to send the sms' do
    expect(subject).to respond_to(:send).with(4).arguments
  end
  it 'sends an SMS' do
    allow(subject).to receive(:send) { "SMS sent" }
  end
end
