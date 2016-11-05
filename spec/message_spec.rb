require 'message'

describe Message do
  subject("message") {described_class.new}

  it {is_expected.to respond_to :send_text}

  before do
    allow(message).to receive(:send_text)
  end

  describe "#send_text" do

    xit "sends a text message to the customer" do
      expect(message).to receive(:send_text)
      message.send_text
    end

  end
end
