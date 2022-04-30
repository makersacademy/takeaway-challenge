describe Text do
  let(:client) { instance_double('Client', messages: self)}
  subject(:text) { Text.new(client) }

  # client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

  describe '#send_completion_message' do
    it 'should instruct client to send text message' do
      expect(client.messages).to receive(:create)
      text.send_completion_message
    end
  end
end