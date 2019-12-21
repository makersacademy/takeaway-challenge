require './lib/menuitems'

describe MenuItems do

  subject(:menu) { described_class.new(menuitems) }

  let(:menuitems) do
    { regina: 12.89, hawaiian: 18.99, bbq_chicken: 12.99, vegan: 14.99, vegetarian: 8.99 }
  end

  describe ".menuitems" do
    context "accesses the initialized variable" do
      it "returns a hash menu to compare result" do
        expect(menu.menuitems).to eq(menuitems)
      end
    end
  end

  describe "#display" do
    context "it displays a menu" do
      it "returns menu and cost per item" do
        text_menu = "Regina £12.89, Hawaiian £18.99, Bbq_chicken £12.99, Vegan £14.99, Vegetarian £8.99"
        expect(menu.display).to eq(text_menu)
      end
    end
  end

  describe "#has_items?" do
    context "checks if item exists in the menu" do
      it "returns true if item listed" do
        expect(menu.has_item?(:regina)).to be true
      end

      it "raises expection if false" do
        expect(menu.has_item?(:havana_sunset)).to be false
      end
    end
  end

  describe "#price" do
    context "it totals the customer order and returns the total cost" do
      it "returns a total cost" do
        expect(menu.price(:regina)).to eq(menuitems[:regina])
      end
    end
  end
end
