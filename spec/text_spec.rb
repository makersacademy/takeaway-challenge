require "text"

describe Text do

  it "generates a text message with the time 1h later" do
    text = Text.new(0)
    expect(text.generate).to eq("Your order has been placed. Your dins will be with you at 3600")
  end

end
