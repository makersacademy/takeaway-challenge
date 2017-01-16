require 'message'

describe SMS do
  let(:amount) { double :amount }
  subject(:sms) { described_class.new amount}

  it 'creates an insatnce of a class' do
    expect(sms).to be_a(SMS)
  end

  it '#sends sms' do
    expect(sms).to respond_to(:send_sms).with(0).argument
  end
end
