describe Order do
  subject { described_class.new(Menu.new) }

  describe "#add_dish" do
    it "adds dishes to order" do
      subject.add_dish("Fish and chips")
      subject.add_dish("Beef wellington")

      expect(subject.order[0].name).to eq("Fish and chips")
      expect(subject.order[1].name).to eq("Beef wellington")
    end
  end

  describe "#total_price" do
    it "returns cost of entire order" do
      subject.add_dish("Fish and chips")
      subject.add_dish("Beef wellington")
      expect(subject.total_price).to eq(19.98)
    end
  end

  describe "#check_price" do
    it "returns true if given price matches total price" do
      subject.add_dish("Fish and chips")
      subject.add_dish("Beef wellington")
      expect(subject.check_price(19.98)).to be_truthy
    end

    it "raises an error if given price does not match total price" do
      expect { subject.check_price(20.00) }.to raise_error("Incorrect price")
    end
  end

  describe '#complete' do
    let(:fake_client) { double }
    let(:fake_message_api) { double }

    it 'sends a text message' do
      allow(Twilio::REST::Client).to receive(:new) { fake_client }

      expect(fake_client).to receive(:messages) { fake_message_api }
      expect(fake_message_api).to receive(:create)

      subject.add_dish("Fish and chips")
      subject.complete
    end
  end
end
