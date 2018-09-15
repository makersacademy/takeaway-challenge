require 'sms'

describe Sms do

  describe '#send_message' do
    it 'creates a sms and send it to the customer' do
      expect(subject).to receive(:send_message).and_return("Hey friend!, You just sent an SMS from Ruby!")
      subject.send_message
    end
  end

end
