require 'receipt'

describe Receipt do
  let(:order) { double(:order, :calculate_total => 10) }
  let(:receipt) { Receipt.new(order) }
  describe "#initialize" do
    it "should initialise a variable type of order" do
      expect(receipt.order).to eq order
    end
  end

  describe "#to_s" do
    it "should return a string receipt" do
      receipt.stub_chain(:order, :basket, :selected_items).and_return({ item1: 5, item2: 3, item3: 4 })
      receipt.stub_chain(:order, :basket, :calculate_total).and_return(10)
      expect(receipt.to_s).to eq "item1 x 5\nitem2 x 3\nitem3 x 4\nTotal: £10.00"
    end
  end
end
