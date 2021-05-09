require "order"

describe Order do
  let(:menu) { double("menu", :list => [
    { name: "Margherita", price: 2 },
    { name: "Pepperoni", price: 3 },
    { name: "Fiorentina", price: 3 },
    { name: "La Reine", price: 4 }
  ]) }

  describe "#add" do
    it "keeps a list of ordered meals" do
      subject.add(menu.list[0])
      expect(subject.meal).to eq ["Margherita"]
    end
    it "keeps the total price of the food" do
      subject.add(menu.list[0])
      subject.add(menu.list[1])
      expect(subject.total_price).to eq 5
    end
  end
end
