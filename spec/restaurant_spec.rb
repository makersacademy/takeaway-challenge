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
    it "An error is raised when the sum of dishes is not equal to the sum of dishes ordered." do
      expect {subject.check_order("1,meat dish,2,vegeterian dish,4")}.to raise_error("Sum of dishes is not correct")
    end

    it "Does not show an error when the sum of the dishes is equal to the sum of dishes ordered" do
      expect {subject.check_order("1,meat dish,2,vegeterian dish,3")}.not_to raise_error
    end
  end
end
