require 'text'

describe Text do
  subject(:text){described_class.new(+441143032749, +447598776122, "Order confirmed")}

  it "has a sender's number" do
    expect(text.to).not_to be nil
  end

  it "has a receiving number" do
    expect(text.from).not_to be nil
  end

  it "has a message" do
    expect(text.message).not_to be nil
  end

  it "can be sent" do
    expect(text).to respond_to(:send)
  end

end
