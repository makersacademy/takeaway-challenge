require 'SMS'

describe SMS do
  subject(:sms) { SMS.new(client: client) }

  let(:client) { double(:client) }
  let(:config) do
    {
        account_sid: "23123",
        auth_token: "djfhskf"
    }
  end

  it 'delivers sms with ETA' do
    sms.deliver_sms
  end

end