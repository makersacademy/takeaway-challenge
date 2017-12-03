require "order"

describe Order do

  subject(:order)    { described_class.new(menu) }
  let(:menu)         { {"Test-dish1" => 10.0, "Test-dish2" => 9.0 } }
  let(:choice)       { "Test-dish1" }
  let(:quantity)     { 2 }
  let(:false_choice) { "Dummy-dish" }

  describe "#initialize" do
    it "creates an empty basket array" do
      expect(order.basket).to be_a(Array)
    end
  end

  describe "#get_choice" do
    it "assigns the choice to an instance variable" do
      allow(STDIN).to receive(:gets) { choice }
      order.get_choice
      expect(order.choice).to eq choice
    end
    it "raises an error if the choice is not on the menu" do
      allow(STDIN).to receive(:gets) { false_choice }
      expect { order.get_choice }.to raise_error("Item not on menu")
    end
  end

  describe "#get_quantity" do
    it "assigns the quantity to an instance variable" do
      allow(STDIN).to receive(:gets) { 2 }
      order.get_quantity
      expect(order.quantity).to eq quantity
    end
  end

  describe "#add_item" do
    it "adds an item x times from the menu hash to the basket array" do
      expect { order.add(choice, quantity) }.to change { order.basket.length }.by quantity
    end
  end

  describe "#total" do
    it "totals the order" do
      order.add(choice, quantity)
      expect(order.total).to eq 20
    end
  end

end
