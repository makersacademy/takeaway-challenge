require 'order_total'

describe OrderTotal do

  describe "#make_receipt" do

    it "takes an array of hashes and returns sum and total of orders" do
      test = [{ "Item 1" => 0.99 }, { "Item 2" => 1.49 }]
      expect(subject.make_receipt(test)).to eq(:"Item 1: 0.99 + Item 2: 1.49 = 2.48 TOTAL")
    end

    it "returns a message if order array empty" do
      test = []
      expect(subject.make_receipt(test)).to eq(:"Nothing ordered!")
    end

  end  

end
