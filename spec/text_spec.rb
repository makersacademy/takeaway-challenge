require 'text'

describe Text do
  let(:input_message) {"hello can i have a menu"}
  let(:reply) {double(:reply)}
  let(:message) {double(:message)}
  let(:client) {double(:client)}
  subject(:text) {described_class.new client}


  before(:example) do
    allow_message_expectations_on_nil
    allow(client).to receive(:messages)
    #allow(message).to receive(:body).and_return(message)
  end

  it {is_expected.to respond_to(:reply)}
  it {is_expected.to respond_to(:send_text).with(1).argument}


  describe '#send_text' do

    before(:example) do
        allow(client.messages).to receive(:create)
    end
    it 'can send out a message' do
      #expect(client).to receive_message_chain(message.create)
      expect(text.send_text(input_message)).to eq input_message
    end
  end


  describe '#reply' do

    before(:example) do
      allow(client.messages).to receive(:list).and_return([input_message])
      allow(client.messages.list).to receive(:each)
    end

    # it 'can create a list of incoming messages' do
    #   expect(text.reply).to eq [input_message]
    # end
  end
end
