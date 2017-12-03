require "order"

describe Order do

  subject(:order)    { described_class.new(menu) }
  let(:menu)         { { "Test-dish1" => 10.0, "Test-dish2" => 9.0 } }
  let(:choice)       { "Test-dish1" }
  let(:quantity)     { 2 }
  let(:false_choice) { "Dummy-dish" }

  describe "#initialize" do
    it "creates an empty basket array" do
      expect(order.basket).to be_a(Hash)
    end
  end

  describe "#add" do
    it "adds an item x times from the menu hash to the basket hash" do
      expect { order.add(choice, quantity) }.to change { order.basket[choice] }.by quantity
    end
    it "raises an error if the choice is not on the menu" do
      expect { order.add(false_choice, quantity) }.to raise_error("Item not on menu")
    end
  end

  describe "#basket_summary" do
    it "displays the contents of the basket hash" do
      order.add(choice, quantity)
      expect { order.basket_summary }.to output("2 x Test-dish1 - £20.00\n").to_stdout
    end
  end

  describe "#total" do
    it "calculates the total of the order" do
      order.add(choice, quantity)
      expect(order.total).to eq 20
    end
  end

  describe "#check_totals" do
    it "raises an error if the running total and total do not match" do
      order.add(choice, quantity)
      order.basket_summary
      allow(order).to receive(:total).and_return(50)
      expect { order.check_totals }.to raise_error("Totals do not match")
    end
  end

  describe "#print_total" do
    it "prints the total of the order" do
      order.add(choice, quantity)
      order.total
      expect { order.print_total }.to output("Total £20.00\n").to_stdout
    end
  end
end
