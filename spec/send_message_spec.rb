require 'send_message'

describe SendMessage do
  let(:subject) { SendMessage.new(true) }

  context '#send' do
    it 'Sends text message' do
      expect(subject.send).to eq "Message sent"
    end
  end
end
