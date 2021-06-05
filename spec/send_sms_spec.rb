require 'send_sms'

describe SendSMS do

  it 'returns the time + one hour' do
    expect(subject.time).to be_truthy
  end
end
