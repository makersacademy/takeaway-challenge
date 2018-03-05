require 'sms'

describe SMS do
  subject(:sms) { described_class.new }

  let(:client_class) { double :client_class, new: client_obj }
  let(:client_obj) { double :client_obj, messages: message_obj }
  let(:message_obj) { double :message_obj }

  describe "sends a text to customers" do

    it "when the order is successfully placed" do
      expect(sms).to respond_to(:send_sms)
    end

    it 'checks client object receives the correct arguments' do
      expect(message_obj).to receive(:create)
      sms.send_sms("body", client_class)
    end

  end
end
