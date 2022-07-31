require "bill"

describe Bill do
  it "starts with 0 pounds" do
    expect(subject.total).to eq(0)
  end

  describe "#add" do
    it "adds prices to the total" do
      subject.add(10)
      expect(subject.total).to eq(10)
      subject.add(5)
      expect(subject.total).to eq(15)
    end
  end
end
