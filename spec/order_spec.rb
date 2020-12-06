describe Order do
  subject { described_class.new(Menu.new) }

  describe "#add_dish" do
    it "adds dishes to order" do
      subject.add_dish("Fish and chips")
      subject.add_dish("Beef wellington")
      expect(subject.order).to eq([ { "Fish and chips" => 10.99 }, { "Beef wellington" => 8.99 } ])
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

    it "returns false if given price does not match total price" do
      expect(subject.check_price(20.00)).to be_falsey
    end
  end
end
