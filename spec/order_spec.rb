require 'order'

describe Order do
  let(:menu) {double(:menu, dishes: {"Lamb Biryani" => dish, "Chicken Malaya" => dish2})}
  let(:dish) { double(:dish, name: "Lamb Biryani", price: 4.99) }
  let(:dish2) { double(:dish, name: "Chicken Malaya", price: 4.50) }
  subject { described_class.new({"Lamb Biryani" => 1, "Chicken Malaya" => 2}, menu)}
  describe "#price" do
    it "should calculate the price of the order, using the inputted menu" do
      expect(subject.price).to eq 13.99
    end
  end
  describe "#add" do
    it "adds a dish to the order" do
      subject.add("Lamb Biryani", 1)
      expect(subject.dishes).to eq({"Lamb Biryani" => 2, "Chicken Malaya" => 2})
    end
  end
  describe "#check" do
    it "should raise an error if a dish is ordered that isn't on the menu" do
      subject.add("Spaghetti",1)
      expect{subject.check}.to raise_error "Error, dish not on menu: Spaghetti"
    end
  end
end
