require 'text'

describe Notification do
  subject(:notification) { described_class.new(client_class) }

  let(:client_messages) { double('client messages', create: "message") }
  let(:client_instance) { double('client instance', messages: client_messages) }
  let(:client_class) { double('client_class', new: client_instance) }

  it 'should be able to try to send a text message' do
    expect(notification).to respond_to(:send_text)
  end

  it 'calls methods' do
    expect(notification.send_text("Allo there")).to eq 'message'
  end
end
