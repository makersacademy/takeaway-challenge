require 'order'

describe Order do

  describe "#initialize" do
    it "should initalize with an empty basket" do
      expect(subject.basket).to be_empty
    end
  end

  describe "#add_order" do
    it "should add an item to the order" do
      subject.add_order("Spring Rolls")
      expect(subject.basket).to eq ["Spring Rolls"]
    end

    it "should add multiple items to the order" do
      subject.add_order("Spring Rolls")
      subject.add_order("Bun Thit Nuong", 2)
      expect(subject.basket).to eq ["Spring Rolls", "Bun Thit Nuong", "Bun Thit Nuong"]
    end
  end
end
