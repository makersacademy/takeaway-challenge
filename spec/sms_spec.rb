require 'sms'

describe SMS do
  subject(:sms) { described_class.new(client: client)}

  let(:client) { double(:client)}
  it 'deliver an sms with the delivery time' do
    sms.deliver
  end


end