require "confirmation"

describe Confirmation do

  it "is able to send a message when called" do
    expect(subject).to respond_to(:message)
  end
end
