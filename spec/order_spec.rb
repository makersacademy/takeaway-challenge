require "order"
#require "takeaway" not required after stub

describe Order do


    it "should show the items that are in the order" do
      expect(subject.order).to be_an(Array)
    end

    it "should display the order as a string" do
      expect(subject.display).to be_an(Array)
    end

end
