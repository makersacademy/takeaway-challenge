require 'sms'

describe Sms do

  describe '#send_message' do
    it 'creates a sms and send it to the customer' do
      expect(subject).to receive(:send_message).with("Thank you for your order: your total is £25.50")
      subject.send_message("Thank you for your order: your total is £25.50")
    end
  end

end
