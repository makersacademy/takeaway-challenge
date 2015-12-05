
require 'send_sms'

describe SendSms do
  subject(:sms) {described_class.new}

  it 'sends text messages with time ahead 45 minutes stamp' do
    expect(sms.confirmation_text).to eq sms.customers
  end
end
