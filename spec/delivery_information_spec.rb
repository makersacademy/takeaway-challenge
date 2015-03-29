require 'delivery_information'

describe DeliveryInformation do
  let(:delinfo) { DeliveryInformation.new }
  it 'has not sent a SMS when created' do
    expect(delinfo.sent_sms).to be false
  end
  it 'sends a SMS to the client once he/she paid' do
  end
  it 'cannot send a SMS more than once' do
  end
end
