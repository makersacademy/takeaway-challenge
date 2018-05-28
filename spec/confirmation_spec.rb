require "confirmation"

describe Confirmation do
  context "---finalizing the order if conditions are met---" do
    it "returns the time before the order must be delivered" do
      expect(subject.delivery_time).to be_instance_of(String)
    end

    it 'sends a text message' do
    expect(subject).to receive(:send_text)
    allow(subject).to receive(:send_text).and_return("test")
    subject.send_text
  end

  end

end
