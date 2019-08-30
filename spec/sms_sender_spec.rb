require './lib/sms_sender'

describe SMSSender do
  let(:messages) { double('Twilio::REST::Client:Messages') }
  let(:client) { double('Twilio::REST::Client') }
  subject { SMSSender.new(client, 'sid', 'token') }

  before :each do
    allow(messages).to receive(:create)
    allow(client).to receive(:new).and_return(client)
    allow(client).to receive(:messages).and_return(messages)
  end

  it { is_expected.to respond_to 'send' }

  describe '#initialize' do
    it 'initializes sms api with sid and token' do
      SMSSender.new(client, 'sid', 'token')
      expect(client).to have_received(:new).with('sid', 'token')
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