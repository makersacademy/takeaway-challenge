require 'order_confirmation' 

describe 'Order Confirmation' do

client = double("client double")
allow(client).to receive(Twilio::REST::Client.new(account_sid, auth_token))
allow(client).to receive(messages)
messages = double("messages double")
allow(messages).to receive(client)
create = double("create double")

  it "sends a message" do
    order_confirmation = Order_confirmation.new
    allow(text_message).to receive(:text_message).and_return 'SM770c036e0c934726871d18958ca4558e'
    expect(order_confirmation.text_message).to eq 'SM770c036e0c934726871d18958ca4558e'
  end

end
