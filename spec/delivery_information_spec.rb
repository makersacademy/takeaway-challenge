require 'delivery_information'

describe DeliveryInformation do
  let(:delinfo) { described_class.new }
  it 'has not sent a SMS when created' do
    expect(delinfo.sent_sms).to be false
  end
  it 'sends a SMS to the client once he/she paid' do
    delinfo.client_pays
    expect(delinfo.sent_sms).to be true
  end
  it 'cannot send a SMS more than once' do
    delinfo.client_pays
    expect { delinfo.client_pays }.to raise_error 'SMS was already sent'
  end
end
