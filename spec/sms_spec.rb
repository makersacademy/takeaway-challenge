require 'sms'

describe SMS do

  subject(:sms) { described_class.new }

  it 'send a text message' do
   expect(sms).to respond_to(:send_sms)
  end
end
