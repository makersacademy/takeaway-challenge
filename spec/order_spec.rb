require "order"

describe Order do
  let(:dish) { double :dish }
  describe "add_dishes" do
    it "adds dishes to the order" do
      out = { "xx" => 5}
      expect(subject.add_dishes("XX - 5")).to eq out
    end
  end
  describe "#count" do
    it "returns the number of items in the order" do
      request = "Sweet and sour chicken - 3, Black bean pork - 1"
      subject.add_dishes(request)
      expect(subject.count).to eq 4
    end
  end
  describe "#total" do
    it "returns the total number of items as specified in the order" do
      request = "Sweet and sour chicken - 3, Black bean pork - 1, total - 4"
      subject.add_dishes(request)
      expect(subject.total).to eq 4
    end
  end
end
