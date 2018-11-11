require "order"

describe Order do

  subject(:order) { described_class.new(menu) }

  let(:dishes) { {chicken: 5, kebab: 2} }
  let(:menu) { double(:menu) }

  describe "#Add" do

    before do
      allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
      allow(menu).to receive(:has_dish?).with(:kebab).and_return(true)
    end

    it "Adds items multiple items to the order" do
      order.add(:chicken, 5)
      order.add(:kebab, 2)
      expect(order.dishes).to eq dishes
    end

    it "Doesn't allow items that are not on the menu to be added" do
      allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
      expect{ order.add(:beef, 2) }.to raise_error "That isn't on the menu!"
    end

  end

end
