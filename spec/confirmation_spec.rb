require "confirmation"

describe Confirmation do
  subject(:confirmation) {described_class.new}

  describe "when instantiated" do
    it "should have an account" do
      expect(confirmation.account).not_to be_nil
    end

    it "should be able to send confirmations" do
      expect(confirmation).to respond_to(:send_confirmation).with(2).argument
    end
  end
end
