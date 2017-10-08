require 'twilio_intergration'
describe TwilioIntergration do
  let(:twilio) { TwilioIntergration }
  let(:message) {double(:message)}

  it ".send_sms should respond" do
    expect(twilio).to respond_to(:send_sms).with(1..2).arguments
  end
end 
  