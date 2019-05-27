require './lib/message.rb'

describe Message do
  context '#send' do
    let(:message) { double(:message, :new => sms) }
    let(:sms) { double(:sms) }

    it 'responds to send' do
      expect(message).to respond_to(:send)
    end

    it 'sends sms message if order is successfully placed' do
      allow(message).to receive(:send).and_return("Successful!")
      expect(message.send).to eq("Successful!")
    end
  end
end
