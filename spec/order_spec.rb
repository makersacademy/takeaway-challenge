require 'order'

describe Order do

  describe "#initialize" do
    it "should initalize with an empty order" do
      expect(subject.order).to be_empty
    end
  end
end
