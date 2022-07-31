require 'total'

describe Total do
  describe "#bill" do
    # can't think of a better way to test this
    it "should sum up the total cost of the order" do
      @total = Total.new
      allow(@total).to receive(:selection).and_return(
          [{:dish => "Burger", :price => 10, :quantity => 5},
          {:dish => "Soup", :price => 5, :quantity => 3},
          {:dish => "Salad", :price => 6, :quantity => 2}])
      expect(@total.bill).to eq(77.0)
    end
  end
end