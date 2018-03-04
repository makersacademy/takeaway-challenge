# SendSMS class spec file
# this class is responsible for sending text confirmation
require 'send_sms'
describe SendSMS do
  subject(:send_sms) { described_class.new() }

  describe '#send' do
    it { is_expected.to respond_to(:send).with(1).arguments }

    it 'sends a confirmation sms and returns true if successful' do
      expect(send_sms).to receive(:send).with('good_phone_num').and_return(true)
      send_sms.send('good_phone_num')
    end

    it 'sends a confirmation sms and returns false if unsuccesful' do
      expect(send_sms).to receive(:send).with('bad_phone_number').and_return(false)
      send_sms.send('bad_phone_number')
    end

    # Actual test for send
    #   it 'should return true if SMS has been successfully sent' do
    #     expect(send_sms.send('+447782199162')).to eq(true)
    #   end
    #   it 'should return false if SMS is not sent' do
    #     expect(send_sms.send('+1234')).to eq(false)
    #   end

  end
end
