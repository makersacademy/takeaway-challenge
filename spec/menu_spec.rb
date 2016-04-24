require "menu"

describe Menu do
  it {expect(subject).to respond_to :dishes }
  describe "#dishes" do
    it "should have a list of dishes available" do
      expect(subject.dishes).to eq subject.dishes
    end
  end
end
