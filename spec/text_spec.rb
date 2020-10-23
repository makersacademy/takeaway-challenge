require_relative '../lib/text'

describe Text do
  subject { described_class.new(12345678) }
  it { is_expected.to respond_to(:send_text) }

  describe ".send_text" do
    it "sends a message to given number" do
      text = "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%k:%M")}"
      expect(subject).to receive(:send_text).with(text)
      allow(subject).to receive(:send_text)
      subject.send_text(text)
    end
  end
end
