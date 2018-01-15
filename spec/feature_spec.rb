require 'takeaway'

describe "Integration test" do

  describe "order multiple items" do

    it "total should be correct" do
      takeaway = Takeaway.new
      takeaway.order("Spring rolls", 2)
      takeaway.order("Spring rolls", 1)
      takeaway.order("Chow mein", 2)
      expect(takeaway.check_total).to eq 32.4
    end

  end

end