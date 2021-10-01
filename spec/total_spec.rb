require 'total'

describe Total do
  describe "#total" do
    it "should sum up the total cost of the order" do
      expect(total.order.bill).to eq(#the bill)
    end
  end
end