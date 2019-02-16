require 'takeaway'

describe Takeaway do
  let (:messages_double) { double :messages }
  let (:text_client_double) { double :text_client, messages: messages_double}

  before (:all) do
    @order = { "burger" => 2, "chips" => 1 }
  end

  it "gives a list of dishes" do
    msg = "You can order from:
burger - £10
chips - £4
salad - £5
lemonade - £2
"
    takeaway = Takeaway.new(text_client_double)
    expect { takeaway.dishes }.to output(msg).to_stdout
  end

  it "accepts orders from customers" do
    takeaway = Takeaway.new(text_client_double)
    expect(takeaway).to respond_to(:place_order)
  end

  it "gives an error if the order total does not match the customer's total" do
    takeaway = Takeaway.new(text_client_double)
    expect { takeaway.place_order(@order, 20) }.to raise_error("incorrect total")
  end

  it "sends a text confirmation if the order total does match the customer's total" do
    takeaway = Takeaway.new(text_client_double)
    expect(takeaway).to receive(:send_text)
    takeaway.place_order(@order, 24)
  end

  it "sends a text confirming the the order will be delivered within an hour" do
    takeaway = Takeaway.new(text_client_double)
    allow(messages_double).to receive(:create) do |args|
      args[:body]
    end
    time = Time.now + (60 * 60)
    text = "Thank you! Your order was placed and will be delivered before #{time}"
    expect(takeaway.place_order(@order, 24)).to eq(text)
  end
end
