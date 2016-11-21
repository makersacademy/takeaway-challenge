require 'sms'
require 'dotenv'

describe SMS do

  let(:sms) { described_class.new }

  it 'responds to send_sms with one argument' do
    expect(sms).to respond_to(:send_sms).with(1)
  end

end
