require 'sms'

describe SMS do
  let(:client) { double :client }

  describe '#send_sms' do
    it 'should send an sms text' do
      sms_create_arguments = {
        from: ENV["SENDING_NUMBER"],
        to: 'mobile_number',
        body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{'%02d' % [Time.now.min]}"
      }
      expect(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(client).to receive_message_chain(:messages, :create).with(sms_create_arguments)
      subject.send_sms('mobile_number')
    end
  end
end
