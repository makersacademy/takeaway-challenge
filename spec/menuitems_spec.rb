require './lib/menuitems'

describe MenuItems do

  # Create a hash to store the menu items
  subject(:menu) { described_class.new(menuitems) }

  # These are the menu items, with a price (in a has hash :))
  let(:menuitems) do
    { regina: 12.89, hawaiian: 18.99, bbq_chicken: 12.99, vegan: 14.99, vegetarian: 8.99 }
  end

  # Compares it to the fake double
  describe ".menuitems" do
    context "accesses the initialized variable" do
      it "returns a hash menu to compare result" do
        expect(menu.menuitems).to eq(menuitems)
      end
    end
  end

  describe "#display" do
    context "it displays a menu" do
      # compares to the method display's output with a text menu
      it "returns menu and cost per item" do
        text_menu = "Regina £12.89, Hawaiian £18.99, Bbq_chicken £12.99, Vegan £14.99, Vegetarian £8.99"
        expect(menu.display).to eq(text_menu)
      end
    end
  end

  describe "#has_items?" do
    context "checks if item exists in the menu" do
      it "returns true if items is listed" do
        expect(menu.item?(:regina)).to be true
      end

      it "returns false if items isnt listed" do
        expect(menu.item?(:havana_sunset)).to be false
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
