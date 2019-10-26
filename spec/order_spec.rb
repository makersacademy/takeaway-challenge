require "order"

describe Order do
  let(:ramen) {double :Dish}
  let(:menu) {double :menu}
  subject(:order) {described_class.new(menu)}

  before do
    allow(menu).to receive(:available?).and_return(true)
  end
  
  context "items" do
  end

  context "order basket" do
    it "has an order basket" do
      expect(subject.basket).to eq([])
    end

    it "adds an item to the basket" do
      subject.add(ramen)
      expect(subject.basket).to include(ramen)
    end

    it "removes an item from the basket" do
      subject.add(ramen)
      subject.remove(ramen)
      expect(subject.basket).not_to include(ramen)
    end

    it "doesn't add items that are not on the menu" do
      allow(menu).to receive(:available?).and_return(false)
      expect{subject.add(ramen)}.to raise_error "This item does not exist on the menu"
    end
  end

  context "total" do
    it "adds up the total for all the selected items" do
      ramen = double(:dish, name: "Ramen", price: 3)
      gyoza = double(:dish, name: "Gyoza", price: 3)
      subject.add(ramen)
      subject.add(gyoza)
      expect(subject.calculate_total).to eq(6)
    end
  end
end