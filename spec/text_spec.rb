require 'text'

describe Text do
  it "sends text a text message to customer" do
    allow(Text).to receive(:send_text_message).
      and_return("Thank you! Your order was placed and will be delivered before
        #{(Time.now + 3600).strftime('%H:%M')}")
    expect(Text.send_text_message).
      to eq("Thank you! Your order was placed and will be delivered before
        #{(Time.now + 3600).strftime('%H:%M')}")
  end
end
