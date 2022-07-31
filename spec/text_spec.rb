require "text"
describe Text do
  describe "#confirmation" do
    it "return a confirmation message" do
      text = Text.new
      expect(text.confirmation).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end
  end
end
