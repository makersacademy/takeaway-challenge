require "message"

describe Message do

  it "writes a confirmation of order message" do
    delivery_time = (Time.now + 3600).strftime("%k:%M") 
    expect(subject.format_message).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end
end
