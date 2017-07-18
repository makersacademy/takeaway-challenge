require 'confirmation'

describe Confirmation do
  subject(:confirmation) { described_class.new(client) }
  let(:messages) { double :something }
  let(:client) { double :anything, messages: messages}

  it "messages to receive create" do
    expect(messages).to receive(:create) { messages }
    confirmation.sent_text
  end

end
