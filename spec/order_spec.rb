require 'order'
require 'item'
require 'text'
require 'twilio'
TEXT = "Thank you! Your order was placed and will be delivered before 18:52".freeze
MESSAGE_RESPONSE = Twilio::TWILIO_200_RESPONSE

describe Order do
  it "add item should return total" do
    subject = Order.new
    dish = Dish.new("spaghetti", 12)
    item = Item.new(dish, 20)
    expect(subject.order(item)).to eq (20 * 12)
  end
  it "should send text" do
    mock_text = double("mock_text", :send_message => MESSAGE_RESPONSE)
    subject = Order.new([], false, mock_text)
    subject.complete_order
    text = Text.new("Thank you! Your order was placed and will be delivered before", "18:52")
    expect(subject.text(text)).to eq(MESSAGE_RESPONSE)
  end
  it "should prevent sending text if not complete" do
    subject = Order.new
    text = Text.new("Thank you! Your order was placed and will be delivered before", "18:52")
    expect { subject.text(text) }.to raise_error 'invalid operation: text'
  end
end
