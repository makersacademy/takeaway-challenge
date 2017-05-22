require_relative "../lib/order.rb"

describe Order do

  let(:order) { subject }

  describe "#bill" do
    it "shows an empty bill" do
      expect(order.bill).to eq []
    end
  end

  describe "#add" do

    before do
      order.add("arepa", 1)
    end

    it "adds one request to the bill" do
      expect(order.bill.count).to eq 1
    end

    it "adds two request to the bill" do
      order.add("yuca", 2)
      expect(order.bill.count).to eq 2
    end

    it "raises an error to a request that does not exist in the list_of_dishes" do
      expect { order.add("baguette", 4) }.to raise_error(MenuError)
    end

    it "pushes request to the bill" do
      order.add("arepa", 2)
      p order.bill
      p order.bill
    end

  end

  describe "#show_bill" do

    before do
      order.add("arepa", 2)
      order.add("cachapa", 3)
    end

    xit "outputs in the console the bill with the dish name and the price" do
      expect(order.show).to output().to_stdout
    end
  end
end
