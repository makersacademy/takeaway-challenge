require 'text'

describe Text do

  let(:client) { double :client }
  subject(:text) { described_class.new(client, ENV["TWILIO_SID_TEST"], ENV["TWILIO_KEY_TEST"]) }

  before "Allow to receive all methods" do
    allow(client).to receive(:new).and_return(client)
    allow(client).to receive(:messages).and_return(client)
    allow(client).to receive(:create).and_return(client)
    allow(client).to receive(:sid)
  end

  it 'calls new on the client' do
    expect(client).to receive(:new)
    new_text = Text.new(client)
  end

  it 'calls messages on the client' do
    expect(client).to receive(:messages)
    text.send("Hello World!")
  end

  it 'calls create on the client' do
    expect(client).to receive(:create)
    text.send("Hello World!")
  end

  it 'calls sid on the client' do
    expect(client).to receive(:sid)
    text.send("Hello World!")
  end

end
