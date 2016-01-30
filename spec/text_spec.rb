require 'text'

describe Text do
  let(:input_message) {"hello can i have a menu"}
  let(:reply) {double(:reply)}
  let(:client) {double(:client)}
  subject(:text) {described_class.new client}


  before(:example) do
  allow(client).to receive(:message)
  end

  it 'can create a list of incoming messages' do
    expect(subject.reply).to eq input_message
  end

end
