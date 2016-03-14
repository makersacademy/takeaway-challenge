require 'dotenv'
Dotenv.load
require 'notify'

describe Notify do
  let(:message) { double :String }
  let(:messages) { double(:Messages, create: nil) }
  let(:twilio_client) { double(:Twilio, messages: messages) }
  let(:twilio_class) { double(:Twilio_class, new: twilio_client) }
  subject(:twilio) { described_class.new(twilio_client: twilio_class) }

  describe '#text' do
    it 'sends a text' do
      argument = {:to=>ENV['PERSONAL'], :from=>ENV['TWILIO'], :body=>message}
      expect(messages).to receive(:create).with argument
      twilio.text message
    end
  end
end
