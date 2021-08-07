require 'check_total'

describe CheckTotal do

  describe "#check_total" do

    it "is expected to take an order hash and return sum and total" do
      test = [{ "Item 1" => 0.99 }, { "Item 2" => 1.49 }]
      expect(subject.check_total(test)).to eq(:"Item 1: 0.99 + Item 2: 1.49 = 2.48 TOTAL")
    end

  end  

end
