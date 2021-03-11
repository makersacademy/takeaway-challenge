require 'order'

describe Order do
  describe "contains" do
    it "a list of all the items for the order" do
      expect(subject.order_list).to be_a(Array)
    end
    it "stores a variable for the order total" do
      expect(subject.order_total).to be_a(Integer)
    end
  end
end
