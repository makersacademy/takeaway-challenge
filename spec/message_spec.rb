require "message"

describe Message do
  subject { described_class.new }

  describe "#generate" do
    it "should generate a new message string" do
      str = "Thank you!\n" +
      "Your order was succesfully placed at #{ Time.new.strftime('%H:%M') }"
      expect(subject.generate).to eq(str)
    end
  end
end
