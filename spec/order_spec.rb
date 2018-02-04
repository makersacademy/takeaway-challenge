require 'order'

describe Order do

  let(:order) { described_class. new }
  let(:dish_1)       { "Prawn Gyoza" }
  let(:quantity_1)   { 4 }
  let(:dish_2)       {"Chicken Gyoza" }
  let(:quantity_2)   { 1 }
  let(:not_in_menu)  { "Chips" }
  let(:not_in_menu_quantity)  { "Chips" }

  context "when initialized" do
    it "contains an empty basket hash" do
      expect(order.basket).to eq(Hash.new)
    end
  end

  describe "#add" do
    before(:each) do
      order.add(dish_1, quantity_1)
      order.add(dish_2, quantity_2)
    end

    it "adds selected dishes and quantities to the basket" do
      hash = { dish_1 => quantity_1, dish_2 => quantity_2}
      expect(order.basket).to eq(hash)
    end

    it "raises an error when a dish not on the menu is added to the basket" do
      error_message = "This dish is not on the menu"
      expect { order.add(not_in_menu, not_in_menu_quantity) }.to raise_error(error_message)
    end
  end

  describe "#remove" do
    before(:each) do
      order.add(dish_1, quantity_1)
      order.add(dish_2, quantity_2)
    end

    it "raises an error if customer tries to remove a dish not in the order" do
      error_message = "This dish is not in your order"
      expect { order.remove("Chips", 3) }.to raise_error(error_message)
    end

    it "reduces the quantity of items from order" do
      expect {order.remove(dish_1, 1)}.to change { order.basket[dish_1] }.by -1
    end

    it "removes dish from basket if its quantity becomes 0" do
      expect {order.remove(dish_1, quantity_1)}.to change{order.basket.length}.from(2).to(1)
    end
  end

  describe "#sub-total" do
    before(:each) do
      order.add("Prawn Gyoza", 2)
      order.add("Chicken Gyoza", 3)
    end

    it "calculates the sub-total for each dish" do
      sub_total = "Prawn Gyoza x2 = £7.02, Chicken Gyoza x3 = £9.33"
      expect(order.sub_total).to eq sub_total
    end
  end

  describe '#total' do
    before(:each) do
      order.add("Prawn Gyoza", 2)
      order.add("Chicken Gyoza", 3)
    end

    it "calculates the overall total" do
      expect(order.total).to eq  "Total cost: £16.35"
    end
  end
end
