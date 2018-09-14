require 'dish'

describe Dish do
  describe "#price" do
    it "should show the price of the dish" do
      expect(subject).to respond_to(:price)
    end
  end

end
