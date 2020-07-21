require "order"

describe Order do
  it "allows to select some number of several available dishes" do
    expect(subject).to respond_to(:dish).with(2).arguments
  end

  describe "#dish" do
    it "adds selected dishes and quantity to order" do
      subject.dish("Pizza", 2)
      expect(subject.order).to eq [{ :name => "Pizza", :price => 15 }]
      expect(subject.total).to eq 30

    end

  end



end
