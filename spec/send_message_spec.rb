require 'send_message'

fdescribe SendMessage do
  let(:subject) { described_class.new(client) }
  let(:client) { double(:client) }

  before do
    allow(client).to receive(:messages).and_return (client)
    allow(client).to receive(:create).and_return (client)
    allow(client).to receive(:sid)
    allow(client).to receive(:time).and_return('time')
  end

  context '#send' do
    it 'sends message' do
      expect(subject.send).to eq "Message sent"
    end
  end
end
