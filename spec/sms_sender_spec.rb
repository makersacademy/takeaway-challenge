require './lib/sms_sender'
require 'twilio-ruby'

describe SMSSender do
  TWILIO_CLIENT   = 'Twilio::REST::Client'
  TWILIO_MESSAGES = 'Twilio::REST::Client::Messages'

  let(:client_class) { class_double(TWILIO_CLIENT) }
  let(:client)       { instance_double(TWILIO_CLIENT) }
  let(:messages)     { instance_double(TWILIO_MESSAGES) }

  subject { SMSSender.new(client_class) }

  before :each do
    allow(client_class).to receive(:new).and_return(client)
    allow(client).to receive(:messages).and_return(messages)
    allow(messages).to receive(:create)
  end

  describe '#initialize' do
    it 'initializes sms api with environment sid and token' do
      SMSSender.new(client_class)
      expect(client_class).to have_received(:new).with(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
    end

    it "has a default client of #{TWILIO_CLIENT}" do
      class TestableSender < SMSSender; attr_reader :client; end
      expect(TestableSender.new.client).to be_instance_of Twilio::REST::Client
    end
  end

  describe '#send_sms' do
    it 'calls injected api with from, to and body' do
      subject.send_sms('to', 'body')
      expect(client).to have_received(:messages)
      expect(messages).to have_received(:create).with(from: ENV['TWILIO_NUMBER'], to: 'to', body: 'body')
    end

    it 'handles exceptions silently' do
      allow(messages).to receive(:create).and_raise(RuntimeError)
      expect { subject.send_sms('to', 'body') }.not_to raise_error
    end
  end
end