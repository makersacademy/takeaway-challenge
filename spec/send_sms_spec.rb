# SendSMS class spec file
# this class is responsible for sending text confirmation
require 'send_sms'
describe SendSMS do
  subject(:send_sms) { described_class.new() }

  describe '#send' do
    it { is_expected.to respond_to(:send).with(3).arguments }

    it 'checks if client object receives the correct arguments' do
      messages = double
      client = double(messages: messages)
      client_class = double(new: client)

      expect(messages).to receive(:create)
      send_sms.send('a good phone number', 22.22, client_class)
    end
  end
end
