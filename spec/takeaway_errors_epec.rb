require 'takeaway_errors'

describe "TakeawayErrors" do

  describe "InvalidSelectionError" do
    it "raises error for invalid order selections" do
      expect { raise InvalidSelectionError }.to raise_error(InvalidSelectionError)
    end
  end

  describe "ZeroQuantityError" do
    it "raises error if quantity <= 0" do
      expect { raise ZeroQuantityError }.to raise_error(ZeroQuantityError)
    end
  end
end
