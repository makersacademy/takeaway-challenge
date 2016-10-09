require 'text'

describe Text do

subject(:text) { described_class.new }

  describe "initialize" do
    it "expects to set up account" do
      expect(subject.client).not_to be nil
    end
  end

  describe "#send_message" do
    it "expects to respond to send_message" do
      expect(subject).to respond_to(:send_message).with(2).arguments
    end
  end
end
