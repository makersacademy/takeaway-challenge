require 'message_service_config'

describe MessageServiceConfig do
  let(:account_sid) { "secret account sid" }
  let(:auth_token) { "secret auth token" }
  let(:from) { "sender phone number" }
  let(:to) { "recipient phone number" }
  let(:subject) \
    { MessageServiceConfig.new(account_sid, auth_token, from, to) }

  it 'has an account sid' do
    expect(subject.account_sid).to eq(account_sid)
  end

  it 'has an auth token' do
    expect(subject.auth_token).to eq(auth_token)
  end

  it 'has a sender' do
    expect(subject.from).to eq(from)
  end

  it 'has a recipient' do
    expect(subject.to).to eq(to)
  end
end
