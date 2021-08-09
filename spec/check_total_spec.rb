require 'check_total'

describe CheckTotal do

  describe "#check_total" do

    it "takes an array of hashes and returns sum and total of orders" do
      test = [{ "Item 1" => 0.99 }, { "Item 2" => 1.49 }]
      expect(subject.check_total(test)).to eq(:"Item 1: 0.99 + Item 2: 1.49 = 2.48 TOTAL")
    end

    it "returns a message if order array empty" do
      test = []
      expect(subject.check_total(test)).to eq(:"Nothing ordered!")
    end

  end  

end
