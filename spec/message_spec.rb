require 'send_sms'

describe Message do
  it 'responds to send' do
    expect(subject).to respond_to :send
  end

  it 'has my api stored' do
    expect(MyApis::TWILIO_ACCOUNT_SID).to be_an_instance_of String
  end
end
