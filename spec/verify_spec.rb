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
    it 'should mock client receiving a sms text to confirm order delivery' do
      messages = double
      client = double(messages: messages)
      client_class = double(new: client)
      expect(messages).to receive(:create)
      subject.send_delivery_confirmation(client_class)
    end
  end
end
