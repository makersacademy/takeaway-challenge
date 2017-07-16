require 'message'

describe Message do
  subject(:message) { described_class.new }

  it "responds to #send_message" do
    expect(message).to respond_to(:send_message)
  end

end
