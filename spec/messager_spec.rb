require "messager"

describe Messager do
  subject(:messager) { described_class.new(12) }

  it "responds to the send" do
    expect(subject).to respond_to(:send)
  end
end