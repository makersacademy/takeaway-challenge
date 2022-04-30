describe Text do
  let(:client) { instance_double('Client', messages: self)}
  subject(:text) { Text.new(client) }

  describe '#send_completion_message' do
    it 'should instruct client to send text message' do
      expect(client.messages).to receive(:create)
      text.send_completion_message('time')
    end

    it 'message should contain expected delivery time' do
      expect(text).to respond_to(:send_completion_message).with(1)
    end
  end
end