require "restaurant"
require "customer"

describe Restaurant do
  it "We are able to make a restaurant" do
    restaurant = Restaurant.new()
  end
  describe "# ask_order" do
    it "We can ask order from the customers." do
      customer_double = double()
      messages_double = double()
      client_double = double(messages: messages_double)
      twilio_class_double = double(new: client_double)
      expect(messages_double).to receive(:create)
      expect(customer_double).to receive(:phone_number)
      subject.ask_order(customer_double, twilio_class_double)
    end
  end

  describe "#check order" do
    it "checks the check order method" do
      order_string_double = double()
      order_double = double()
      order_class_double = double(new: order_double)
      restaurant = Restaurant.new(order_class_double)
      expect(order_double).to receive(:check_order)
      restaurant.check_order(order_string_double)

    end
  end

  describe "#confirmation_sending" do
    it "Sends a message to me when I make a correct order" do
      order_string_double = double()
      customer_double = double()
      message_double = double()
      client_double = double( messages: message_double)
      twilio_class_double = double(new: client_double)

      expect(message_double).to receive(:create)
      expect(customer_double).to receive(:phone_number)
      expect(subject).to receive(:check_order).with(order_string_double)
      subject.confirmation_sending(customer_double, order_string_double, twilio_class_double)
    end
  end
end
