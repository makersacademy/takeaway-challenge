require 'order'

describe Order do
  it "initializes with an empty basket" do
    expect(subject.basket).to be_empty
  end

  describe "#add_to_order" do
    it "add_to_order method has 1 argument" do
      expect(subject).to respond_to(:add_to_order).with(1).arguments
    end
  end
end
