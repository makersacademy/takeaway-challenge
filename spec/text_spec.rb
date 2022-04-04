require_relative '../lib/text.rb'

describe Message do
  subject(:text) { described_class.new(client) }
  let(:client) { double :client }


  it 'responds to send_message method' do
    expect(text).to respond_to(:send)
  end

end