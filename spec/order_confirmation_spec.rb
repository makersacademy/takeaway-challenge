require 'order_confirmation' 

describe 'Order Confirmation' do
  it "sends a message" do
    time = Time.now + 1 * 60 * 60

    client = double("client double")
    messages = double("messages double")
    create = double("create double")
    message = double("message double")

    allow(Twilio::REST::Client).to receive(:new).and_return client
    allow(client).to receive(:messages).and_return messages
    expect(messages).to receive(:create).with(to: "+447824701051", from: "+447360542270", body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%I:%M %p")}")

    order_confirmation = OrderConfirmation.new
    order_confirmation.send_text_message
  end
end
