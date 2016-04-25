require "order"

describe Order do
  subject(:order) { described_class.new }

  describe "#initialize" do
    it 'has no items in the order' do
      expect(order.items).to be_empty
    end
    it 'has a total value of 0' do
      expect(order.total).to be 0.0
    end
  end

  describe "#add" do
    it 'adds a new item to the order' do
      order.add("Pollo", "10.00", 2)
      current_order = { dish: "Pollo", price: "10.00", quantity: 2 }
      expect(order.items).to eq [current_order]
    end
  end

  describe "#totals" do
    it "calculates the total order value" do
      order.add("Zucchini", "5.00", 2)
      order.add("Calzone", "11.95", 1)
      expect(order.totals).to eq 21.95
    end
  end

  describe "#display" do
    it 'displays the order on the screen' do
      order.add("Pollo", "10.00", 2)
      spacing = Order::LINEWIDTH
      line1 = "-"*(spacing-9) + "\n"
      line2 = "ORDER\n\n"
      line3 = "Item".ljust(spacing/2) + "Price".ljust((spacing-34)/2) +
              "Quantity".ljust(spacing) +  "\n"
      line4 = "----".ljust(spacing/2) + "-----".ljust((spacing-34)/2) +
              "--------".ljust(spacing) + "\n"
      line5 = "Pollo".ljust(spacing/2)+(("£10.00").ljust((spacing-34)/2)) +
              "x2".ljust(spacing)
      line6 = "\n" + ("-"*(spacing-9)) + "\n"
      message = line1 + line2 + line3 + line4 + line5 + line6
      expect { order.display }. to output(message).to_stdout
    end
  end
end
