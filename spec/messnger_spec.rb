require 'messenger'

describe Messenger do
  let(:messages) { double :Messages, :create => true }
  let(:twilio_client) { double :Client, :messages => messages}

  subject(:messenger) { described_class.new(client: twilio_client) }

  it 'Makes call to Twilio API' do
    expect(twilio_client).to receive(:messages)
    expect(messages).to receive(:create)
    messenger.send_text
  end

end
