require 'message'

describe SMS do
  let(:amount) { double :amount }
  subject(:sms) { described_class.new amount}


  it 'creates an insatnce of a class' do
    expect(sms).to be_a(SMS)
  end

  it 'sends sms' do
    expect(sms).to respond_to(:send_sms).with(0).argument
  end

  it 'prints error if sms was not sent' do
    allow(sms).to receive(:send_sms)
    #expect { sms.send_sms }.to output.to_stdout
  end
end
