require 'credentials'

describe Credentials do
  it 'allows you to access the Twilio account SID' do
    expect(Credentials).to respond_to(:acc_sid)
  end
  it 'allows you to access the Twilio account authentication token' do
    expect(Credentials).to respond_to(:auth_token)
  end
  it 'allows you to access the Twilio account sender telephone number' do
    expect(Credentials).to respond_to(:sender)
  end
end
