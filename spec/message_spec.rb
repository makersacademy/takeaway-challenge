require "order"
require "message"

describe Message do
  it "creates a method class" do
    expect(Message).to respond_to(:new)
  end
end
