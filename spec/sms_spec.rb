require_relative '../lib/sms.rb'

describe SMS do
  it 'sends a confirmation text to the user' do
    expect(subject).to receive(:send_sms)
    subject.send_sms
    end
end