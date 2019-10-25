require "./docs/text"

describe Text do
  let(:text) { Text.new }

  it "sends a text message when an order has been placed" do
    expect(text.message).to be true
  end
end
