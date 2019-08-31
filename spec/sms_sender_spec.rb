require './lib/sms_sender'
require 'twilio-ruby'

describe SMSSender do
  TWILIO_CLIENT   = 'Twilio::REST::Client'
  TWILIO_MESSAGES = 'Twilio::REST::Client::Messages'

  let(:client_class) { class_double(TWILIO_CLIENT) }
  let(:client)       { instance_double(TWILIO_CLIENT) }
  let(:messages)     { instance_double(TWILIO_MESSAGES) }

  let(:number)       { ENV['TWILIO_NUMBER'] }
  let(:sid)          { ENV['TWILIO_SID'] }
  let(:token)        { ENV['TWILIO_TOKEN'] }

  subject { SMSSender.new(client_class) }

  before :each do
    allow(client_class).to receive(:new).and_return(client)
    allow(client).to receive(:messages).and_return(messages)
    allow(messages).to receive(:create)
  end

  describe 'test assumptions' do
    it 'assumes that relevant environment variables are non-empty and unique' do
      expect(number).not_to be_empty
      expect(sid).not_to be_empty
      expect(token).not_to be_empty
      expect([number, sid, token].uniq.size).to eq 3
    end
  end

  describe '#initialize' do
    it 'initializes sms api with environment sid and token' do
      SMSSender.new(client_class)
      expect(client_class).to have_received(:new).with(sid, token)
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

    it 'returns exception messages' do
      allow(messages).to receive(:create).and_raise(Twilio::REST::TwilioError)
      expect(subject.send_sms('to', 'body')).to eq 'Twilio::REST::TwilioError'
    end
  end
end