describe Message do
  context '#send' do
    let(:message) { double(:message, :new => sms) }
    let(:sms) { double(:sms, :send => "Successful!") }

    it 'sends sms message if order is successfully placed' do
      expect(message.send).to eq("Successful!")
    end # here
  end
end
