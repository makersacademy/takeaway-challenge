require "order_total"

describe OrderTotal do
  subject(:order_total) {described_class.new}
  let(:item) {double(:item)}

  describe "when dealing with an order" do

    it "the total should by default be nil" do
      expect(order_total.total).to be_nil
    end

    it "should calculate the total of an item" do
      allow(item).to receive(:price).and_return(10)
      allow(item).to receive(:amount).and_return(1)
      expect(order_total.item_total(item)).to eq 10
    end

    it "should be table to calculate the total of several items" do
      expect(order_total).to respond_to(:calculate).with(1).argument
    end

    it "should be table to calculate the total of several items" do
      items = [item, item]
      allow(item).to receive(:price).and_return(10)
      allow(item).to receive(:amount).and_return(1)
      order_total.calculate(items)
      expect(order_total.total).to eq 20
    end
  end

end
