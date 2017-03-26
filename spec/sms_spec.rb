require 'sms'

describe Sms do
  subject(:sms) {described_class.new}

  it 'sends confirmation sms' do
    expect(sms).to respond_to(:confirmation_sms)
  end
end
