require 'text'

describe Text do
  let(:twilio_double) {double :twilio, create: true}
  let(:twilio_client_double) {double :twilio_client, messages: twilio_double}
  let(:twilio_client_class_double) { double :twilio_client_class, new: twilio_client_double}
  let(:text) { described_class.new(twilio_client_class_double) }

  describe '#new'  do
    it 'should be instance' do
      expect(text).to be_instance_of described_class
    end
  end

  describe '#send_message' do
    it 'should send a message' do
      expect(text.send_message).to eq true
    end
  end
end
