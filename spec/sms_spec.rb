require './lib/sms.rb'

describe SMS do
  subject(:sms) { described_class.new }
  let(:client) { double(:client) }

  let(:config) do
    {
      account_sid: "123",
      auth_token: "23fds"
    }
  end

  it 'deliver sms with a time' do
    sms.delivered
  end

end
