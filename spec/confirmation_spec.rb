require 'confirmation'

describe Confirmation do

  subject(:confirmation) { described_class.new(client) }
  let(:client) { double :client, messages: messages }
  let(:messages) { double :messages }

  it 'sends sms message' do
    expect(messages).to receive(:create)
    confirmation.send_message
  end

end
