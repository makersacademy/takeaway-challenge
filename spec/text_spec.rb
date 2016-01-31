require 'text'

describe Text do
  let(:input_message) {"hello can i have a menu"}
  let(:reply) {double(:reply)}
  let(:message) {double(:message)}
  let(:client) {double(:client)}
  subject(:text) {described_class.new client}


  before(:example) do
    # allow(client).to receive(:messages)
    # allow(client.messages).to receive(:list)
    # allow(client.messages.list).to receive(:each)
    # allow(message).to receive(:body).and_return("hello")
  end

  it {is_expected.to respond_to(:reply)}
  it {is_expected.to respond_to(:send_text).with(1).argument}
  it {is_expected.to respond_to(:send_text)}

  # it 'can create a list of incoming messages' do
  #   expect(subject.reply).to eq [input_message]
  # end

end
