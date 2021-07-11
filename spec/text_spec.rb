require 'text'

describe Text do

  describe 'responds to methods' do
    it 'responds to text confirmation' do
      expect(subject).to respond_to(:text_confirmation) 
    end
    it 'responds to message' do
      expect(subject).to respond_to(:message) 
    end
  end

  describe '#message' do
  # let messages double receive .create('Message')
    let(:messages) { double(:messages, create: 'Message') }
  # let client double receive messages method (with messages double)
    let(:client) { double(:client, messages: messages) }
   # let the subject equal a new instance with @client = client
    let(:subject) { described_class.new(client) }

    it 'it holds a message' do
      allow(subject).to receive(:message) { 'Message' }
      expect(subject.message).to eq('Message')
    end

    it 'reads environmental variables' do
      ENV['INCOMING'] = '1111111'
      ENV['OUTGOING'] = '2222222'
      expect(subject.message).to include(from: "2222222")
    end

    it 'interacts with text_confirmation' do
      allow(subject).to receive(:message) { 'Message' }
      subject.text_confirmation
      expect(messages).to have_received(:create).with('Message')
    end

  end

end
