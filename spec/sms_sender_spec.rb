# frozen_string_literal: true

require './lib/sms_sender'
require 'twilio-ruby'

describe SMSSender do
  TWILIO_CLIENT   = Twilio::REST::Client
  TWILIO_MESSAGES = Twilio::REST::Api::V2010::AccountContext::MessageList
  TWILIO_ERROR    = Twilio::REST::TwilioError

  let(:client_class) { class_double(TWILIO_CLIENT) }
  let(:client)       { instance_double(TWILIO_CLIENT) }
  let(:messages)     { instance_double(TWILIO_MESSAGES) }

  let(:number)       { ENV['TWILIO_NUMBER'] }
  let(:sid)          { ENV['TWILIO_SID'] }
  let(:token)        { ENV['TWILIO_TOKEN'] }

  subject { described_class.new(client_class) }

  before :each do
    allow(client_class).to receive(:new).and_return(client)
    allow(client).to receive(:messages).and_return(messages)
    allow(messages).to receive(:create)
  end

  describe 'test assumptions', :aggregate_failures do
    it 'assumes that relevant environment variables are non-empty and unique' do
      expect(number).not_to be_empty
      expect(sid).not_to be_empty
      expect(token).not_to be_empty
      expect([number, sid, token].uniq.size).to eq 3
    end
  end

  describe '#initialize' do
    it 'initializes a given sms class with sid and token environment variables' do
      described_class.new(client_class)
      expect(client_class).to have_received(:new).with(sid, token)
    end

    it "has a default sms class of #{TWILIO_CLIENT}" do
      class TestableSender < SMSSender; attr_reader :client; end
      expect(TestableSender.new.client).to be_instance_of TWILIO_CLIENT
    end
  end

  describe '#send_sms' do
    before :each do
      subject.send_sms('to', 'body')
    end

    it 'should ask the sms class instance for a messages object' do
      expect(client).to have_received(:messages)
    end

    it 'should ask the messages object to create a new message' do
      expect(messages).to have_received(:create).with(from: number,
                                                      to: 'to',
                                                      body: 'body')
    end

    it "should return the sms instance's exception messages" do
      allow(messages).to receive(:create).and_raise(TWILIO_ERROR)
      expect(subject.send_sms('to', 'body')).to eq 'Twilio::REST::TwilioError'
    end
  end
end