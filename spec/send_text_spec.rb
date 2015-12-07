require 'send_text'

describe SendText do
  subject(:sms) {described_class.new}

  it 'sends a text message for with order confirmation and delivery time' do
    expect(sms.confirmation_text).to eq sms.customers
  end
end
