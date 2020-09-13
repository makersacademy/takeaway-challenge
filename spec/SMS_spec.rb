require 'SMS'

describe SMS do
  subject(:sms) { SMS.new(client: client) }

  let(:client) { double(:client) }
  let(:config) { double(:config) }

  it 'delivers sms with ETA' do
    sms.deliver_sms
  end

end