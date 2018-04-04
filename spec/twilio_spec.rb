require 'twilio'

describe Message do

  it { should respond_to :send }

  subject(:message) { described_class.new }

  it "sends a confirmation text" do
    VCR.use_cassette('twilio') do
      message.send_message
    end
  end
end

# describe Sms do
#   let(:client) { double :client }
#   let (:subject) { described_class.new(client) }
#   allow(client).to receive(:messages)
#   describe '#send' do
#     it "send the user an sms" do
#       # what do we want to test???
#       allow(client).to receive(:messages)
#       expect(subject.client.messages).to receive(:create)
#       subject.send(15.55)
#     end
#   end
# end
