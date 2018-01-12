require 'menu'

describe Menu do
  let(:dish) { double(:dish, name: "Lamb Biryani", to_s: "Lamb Biryani, £4.99") }
  let(:dish2) { double(:dish, name: "Chicken Malaya", to_s: "Chicken Malaya, £4.50") }
  before do
    subject.add_dish(dish)
    subject.add_dish(dish2)
  end
  describe "#to_s" do
    it "should return a list of Dishes as strings" do
      expect(subject.to_s).to eq "Lamb Biryani, £4.99\nChicken Malaya, £4.50"
    end
  end
  describe "#dishes" do
    it "returns a copy of the dishes hash" do
      expect(subject.dishes).to eq({"Lamb Biryani" => dish, "Chicken Malaya" => dish2})
    end
  end
end
