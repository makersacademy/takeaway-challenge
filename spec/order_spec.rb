require 'order'

describe Order do

  let(:food) { double(:food)}
  let(:price) {double(:price)}
  let(:choice) { {food: price} }

  it "responds to the method #add" do
    expect(subject).to respond_to(:add)
  end

  describe "#add" do
    it "stores dishes and prices in an array when #add is called" do
      subject.add(choice)
      expect(subject.selection).to include(choice)
    end
  end

  describe "#total" do
    it "calculates the total of the order" do
      subject.add([:trout_snout, 6.5])
      subject.add([:hog_soup, 4.9])
      subject.add([:boring_sandwich, 4.0])
      expect(subject.total).to eq(15.4)
    end
  end

end
