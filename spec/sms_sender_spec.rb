require './lib/sms_sender'
require 'twilio-ruby'

describe SMSSender do
  let(:client_class) { class_double('Twilio::REST::Client') }
  let(:client) { instance_double('Twilio::REST::Client')}
  let(:messages) { instance_double('Twilio::REST::Client::Messages') }
  subject { SMSSender.new(client_class, 'sid', 'token') }

  before :each do
    allow(messages).to receive(:create)
    allow(client_class).to receive(:new).and_return(client)
    allow(client).to receive(:messages).and_return(messages)
  end

  it { is_expected.to respond_to 'send' }

  describe '#initialize' do
    it 'initializes sms api with sid and token' do
      SMSSender.new(client_class, 'sid', 'token')
      expect(client_class).to have_received(:new).with('sid', 'token')
    end
  end

  describe '#send' do
    it 'calls injected api with from, to and body' do
      subject.send('from', 'to', 'body')
      expect(client).to have_received(:messages)
      expect(messages).to have_received(:create).with(from: 'from', to: 'to', body: 'body')
    end
  end
end