require 'message_sender'

describe MessageSender do

subject(:message_sender) {described_class.new}
let(:test_message) { "Hello" }

describe '#create_message' do
  it 'generates a message' do
    
  end
end

describe '#send_message' do
  it 'uses twilio to send a message' do
    allow(message_sender.client.account.messages).to receive(:create) {true}
    expect(message_sender.send_message(test_message)).to eq(true)
  end

end


end
