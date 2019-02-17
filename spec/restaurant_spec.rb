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
end
