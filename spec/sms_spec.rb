require 'sms'

describe Sms do 
subject(:sms) { described_class.new }
  describe '#send' do 
    it 'sends a message' do 

# set-up
client = double('represents a client')  # let(:client) { double :client }
client_messages = double('represents messages') # let(:messages) { double :messages }
info = { 'body' => 'data' }

allow(client).to receive(:messages).and_Return(client_messages)
allow(client_messages).to receive(:create).with(info).and_return('WE MADE IT')

sms = Sms.net(client)

# expectation 
expect(sms.send!).to eq 'WE MADE IT'

    end
  end
end
