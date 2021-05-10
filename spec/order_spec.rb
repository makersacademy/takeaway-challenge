require "order"

describe Order do
  let(:menu) { double("menu", :list => [
    { name: "Margherita", price: 2 },
    { name: "Pepperoni", price: 3 },
    { name: "Fiorentina", price: 3 },
    { name: "La Reine", price: 4 }
  ]) 
}

  describe "#add" do
    it "keeps a list of ordered meals" do
      subject.add(menu.list[0][:name])
      expect(subject.meal).to eq ["Margherita"]
    end
    it "keeps the total price of the food" do
      subject.add(menu.list[0][:name])
      subject.add(menu.list[1][:name])
      expect(subject.total_price).to eq 5
    end
  end

  describe "#place_order" do
    let(:phone_number) { double(:phone_number) }
    it "returns self" do
      expect(subject.place_order(phone_number)).to eq subject
    end
  end
end
