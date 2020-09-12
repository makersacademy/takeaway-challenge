require "order"
require "message"

describe Message do
  let(:twilio_create_double) { double :twilio_create_double, create: nil }
  let(:twilio_double) { double :twilio_double, messages: twilio_create_double }
  let(:twilio_class_double) { double :twilio_class_double, new: twilio_double }
  let(:message) { Message.new("", "", "", twilio_class_double) }

  it "creates a method class" do
    expect(Message).to respond_to(:new).with(3).arguments
  end

  describe "#send_message" do
    it "doesn't raise an error when a message is to be sent" do
      expect { message.send_message("123456789", "Thank you for your order!") }.not_to raise_error
    end
  end
end
