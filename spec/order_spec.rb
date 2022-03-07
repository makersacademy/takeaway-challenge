require 'order'

describe Order do

  let(:dish) { double(:dish, name: "Large Chips", price: 2.99)}
  let(:another_dish) { double(:dish, name: "Large Cod", price: 5)}
  
  describe "#add" do
    subject { described_class.new([dish, another_dish]) }
    it "adds the dish to the order" do
      subject.add(1)
      expect(subject.total).to eq(2.99)
    end
  end
  describe "#delete" do
    subject { described_class.new([dish, another_dish]) }
    it "deletes the dish from the order" do
      subject.add(1)
      subject.add(2)
      subject.delete(1)
      expect(subject.total).to eq(5)
    end
  end
  describe "#total" do
    subject { described_class.new([dish, another_dish]) }
    it "returns the sum of the order" do
      subject.add(1)
      subject.add(2)
      expect(subject.total).to eq(7.99)
    end
  end
end