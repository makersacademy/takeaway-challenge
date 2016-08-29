require "text"

describe Text do

  it "Should be able to send a message" do
    expect(subject).to respond_to(:send)
  end

end
