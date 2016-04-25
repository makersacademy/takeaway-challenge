require "menu"

describe Menu do
  it {expect(subject).to respond_to :dishes }

  describe "#dishes" do
    it "should have a list of dishes available" do
      expect(subject.dishes).to eq subject.dishes
    end
  end

  describe "#add" do
    it "should add food items to the menu" do
      subject.add "Chicken", 3
      expect(subject.dishes).to include("Chicken" => 3)
    end
  end

  describe "#remove" do
    it "should remove food items from the menu" do
      subject.remove "Kotletai"
      expect(subject.dishes).not_to include("Kotletai" => 4)
    end
  end
end
