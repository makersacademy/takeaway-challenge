require 'verify'

describe Verify do
  describe '#verify_order' do
    it 'Should set @user_confirm to y and call send_delivery_confirmation' do
      allow(subject).to receive(:chomp) { "y" }
      expect(subject).to receive(:send_delivery_confirmation)
      subject.verify_order
    end
  end

  describe '#send_delivery_confirmation' do
  let(:fake_client) { double 'client' }
  let(:fake_arg) { double 'arg' }
    it 'mocks sms send after verify confirm y' do
      allow(@client).to receive(:messages)
      allow(@client).to receive(:create).with(fake_arg) { "test" }
      allow("test").to receive(:sid) { "test" }
      expect(subject.send_delivery_confirmation).to eq "test"
    end
  end
end

# Test code source (devcamp):
# https://rails.devcamp.com/rest-microservices/sms-messages/creating-a-rspec-stub-to-mimic-sending-sms-messages

#
# it 'sends a text message via the Twilio API after a notication is created' do
#     headers = {
#       "ACCEPT" => "application/json"
#     }
#
#     post "/notifications",
#     {
#       notification: {
#         phone: "1234567890",
#         body: "New Message",
#         source_app: "my_app_name"
#       }
#     }, headers
#
#     expect(FakeSms.messages.last.num).to eq("1234567890")
#   end
