require 'text'

describe Text do

subject(:text) { described_class.new("Thank you!", '+447857134614') }

  describe "initialize" do
    it "expects to set up account" do
      expect(subject.client).not_to be nil
    end

    it "expects message to be provided" do
      expect(subject.message).to eq "Thank you!"
    end

    it "expects customer mobile to be provided" do
      expect(subject.customer_mobile).to eq '+447857134614'
    end
  end

  describe "#send_message" do
    it "expects to respond to send_message" do
      expect(subject).to respond_to(:send_message)
    end
  end
end
