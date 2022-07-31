require 'sms_send'

describe Sms do
  let(:sms) {double(:sms, send: message)}
  let(:message) {double(:message)}

  it "sends sms messages" do
    expect(sms.send).to eq message
  end
end
