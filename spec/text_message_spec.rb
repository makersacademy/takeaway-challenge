require 'text_message'

describe TextMessage do
subject(:text_message) { described_class.new(client: client) }

let(:text_message) { double(:text_message)}
  it 'delivers a text message with an estimated delivery time' do
    text_message.deliver

  end

end
