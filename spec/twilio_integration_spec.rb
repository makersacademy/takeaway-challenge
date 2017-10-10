require 'twilio_integration'
describe TwilioIntegration do
  let(:twilio) { TwilioIntegration }
  let(:message) { double(:message) }

  it ".send_sms should respond" do
    expect(twilio).to respond_to(:send_sms).with(1..2).arguments
  end
end 
  