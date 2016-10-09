require 'credentials'

describe Credentials do
  it 'allows you to access the Twilio account SID' do
    expect(Credentials.acc_sid).to be_truthy
  end
  it 'allows you to access the Twilio account authentication token' do
    expect(Credentials.auth_token).to be_truthy
  end
  it 'allows you to access the Twilio account sender telephone number' do
    expect(Credentials.sender).to be_truthy
  end
end
