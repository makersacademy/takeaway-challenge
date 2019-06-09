require 'sms'

RSpec.describe Sms do

  let(:twilio){ double :twilio }
  subject(:sms){ described_class.new(twilio) }

    describe '#send_text' do
      it 'sends a payment confirmation text message' do
        allow(twilio).to receive(:messages).and_return(twilio)
        allow(Time).to receive(:new).and_return(Time.parse('12:18'))
        allow(Time).to receive(:now).and_return(Time.parse('12:18'))
        phone_number = ENV['TWILIO_DESTINATION_PHONE']

        expect(twilio).to receive(:create).with({
          :body => "Thank you for your order. It will be delivered at 13:18",
          :from => ENV['TWILIO_PHONE_FROM'],
          :to => phone_number
        })
        sms.send_text(phone_number)
      end
    end
end
