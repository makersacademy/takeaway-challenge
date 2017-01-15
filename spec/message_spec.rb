require 'message'

describe SMS do
  let(:amount) { double :amount }
  subject(:sms) { described_class.new amount}

  it 'creates an insatnce of a class' do
    expect(sms).to be_a(SMS)
  end

  it 'sends sms' do
    # how can we check that message was send???
  end
end
