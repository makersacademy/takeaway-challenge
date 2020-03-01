require "order"

describe Order do
  it "allows to select some number of several available dishes" do
    expect(subject).to respond_to(:dish).with(2).arguments
  end

  describe "#dish" do
    it "adds selected dishes and quantity to order" do


    end

  end



end
