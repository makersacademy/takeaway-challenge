require "message"

describe Message do
  subject { described_class.new }
  let(:total) { 10 }
  let(:delivery_time) { Time.new + 3600 }
  let(:str) do
    "Thank you! Your order came to £#{ total }. "\
    "Our baristas are new, so expect your drinks "\
    "at #{ delivery_time.strftime('%I:%M%P') }"
  end

  describe "#generate" do
    it "should generate a new message string" do
      expect(subject.generate(total)).to eq(str)
    end
  end
end
