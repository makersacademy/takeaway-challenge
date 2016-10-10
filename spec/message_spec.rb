require 'message'

describe Message do
  subject("message") {described_class.new}

  xdescribe "#send_text" do

    it "sends a text message to the customer" do
      message.send_text
      expect(message.send_text).to
    end
  end
end
