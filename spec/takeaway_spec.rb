require "takeaway"

describe Takeaway do
  context "customer has ordered multiple dishes" do
    before do
      subject.select_dish("fish & chips")
      subject.select_dish("330ml can")
    end

    it "selects several available dishes" do
      expect(subject.select_dish("pudding")).to eq("pudding added!")
    end

    it "verifies that the order is correct" do
      expect(subject.order_total).to eq(5)
    end
  end

  it "shows a list of dishes with prices" do
    expect(subject.list_dishes).to include("fish & chips", "£")
  end

  describe "text messaging system works" do
  end
end