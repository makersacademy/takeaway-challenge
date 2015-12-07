require 'send_text'

describe SendText do
  subject(:sms) {described_class.new}

  it 'sends a text message for order confirmation with delivery time' do
    expect(sms.confirmation_text).to eq sms.customers
  end
end
