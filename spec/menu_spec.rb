require "menu"

describe Menu do
  let(:dish) { double :dish, name: "XX", price: 5 }
  let(:dish2) { double :dish2, name: "XXX", price: 5 }
  let(:dish_kl) { double :dish_kl, new: dish }
  let(:dish_kl2) { double :dish_kl, new: dish2 }
  describe "#menu" do
    it "shows the menu" do
      display = { "XX" => 5, "XXX" => 5 }
      subject.add_dish("XX", 5, dish_kl)
      subject.add_dish("XXX", 5, dish_kl2)
      expect(subject.show).to eq display
    end
  end
  describe "#add_dish" do
    it "adds a dish to the menu" do
      expect(subject.add_dish("XX", 5, dish_kl)).to eq [dish]
    end
  end
end
