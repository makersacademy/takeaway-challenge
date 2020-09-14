require 'basket'
require 'timecop'
describe Basket do
  it "contains the current order array" do
    expect(subject.instance_variable_get(:@current_order)).to be_an_instance_of(Array)
  end
  
  describe "#price" do

    it "calculates the total price for basket" do 
      order = [
        { food: "vinegar yogurt", price: 3 },
        { food: "pickled crumpets", price: 6 },
        { food: "tomato ice-cream", price: 2 }
              ]
      y =  Basket.new(order)
      y.price_total
      expect(y.instance_variable_get(:@price)).to eq 11
    end
  end

  describe "#order_summary" do 
    order_array = [{ food: "vinegar yogurt", price: 3 }, { food: "pickled crumpets", price: 6 },{ food: "tomato ice-cream", price: 2 }]
    let(:order) {Basket.new(order_array)}
    it "returns a summary of the order and the price for comparison to the menu" do
      order.price_total
      expect(order.order_summary).to eq  "Order Summary \ndish: vinegar yogurt, dish price: 3 \ndish: pickled crumpets, dish price: 6 \ndish: tomato ice-cream, dish price: 2 \nTotal price :11GBP"
      

    end
  end

  describe "#confirm_order" do 
  #Add timecop here and include time detail in twilio_double 
  #twilio_double = double :twilio, send_message: "order Confirmed:\n Total Price 3 \n Estimated Delivery time"
    it "sends a message confirming delivery one hour from now" do
      new_time = Time.local(2020, 12, 20, 11, 0)
      Timecop.freeze(new_time)
      twilio_double = double :twilio, send_message: "Order Confirmed:\n Total Price 3 \n Estimated Delivery time "
      basket = Basket.new([
        { food: "vinegar yogurt", price: 3 },
        { food: "pickled crumpets", price: 6 },
        { food: "tomato ice-cream", price: 2 }])
      basket.price_total
      expect(basket.confirm_order).to eq "Order Confirmed:\n Total Price 3 \n Estimated Delivery time 12"

    end
  end
  #add tests here  

end