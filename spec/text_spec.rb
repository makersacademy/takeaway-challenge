require 'text'

describe Text do

  it "can get the customer's phone number" do
    allow(subject).to receive(:customer_no).and_return("12345678910")
    expect(subject.customer_no).to eq("12345678910")
  end

  it "can create a message with delivery time" do
    allow(subject).to receive(:delivery_time).and_return("10:30")
    expect(subject.create_message).to eq("Your order has been placed and will arrive before 10:30")
  end

end