describe Text do
  let(:client) { instance_double('Client', messages: self)}
  
  subject(:text) { Text.new(client) }

  describe '#send_completion_message' do
    it 'should instruct client to send text message' do
      expect(client.messages).to receive(:create)
      text.send_completion_message('time')
    end
  end
end
