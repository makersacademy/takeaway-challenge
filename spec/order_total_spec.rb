require "order_total"

describe OrderTotal do
  subject(:order_total) {described_class.new}
  let(:item) {double(:item)}

  describe "when dealing with an order" do

    it "the total should by default be nil" do
      expect(order_total.total).to be_nil
    end

    it "should calculate the total of the order" do
      order_total.calculate
      expect()
    end
  end

end
