require "order"

describe Order do

  subject(:order)    { described_class.new(menu) }
  let(:menu)         { {"Test-dish" => 10.00} }
  let(:choice)       { "Test-dish" }
  let(:quantity)     { 2 }
  let(:false_choice) {"Dummy-dish"}

  describe "#initialize" do
    it "creates an empty basket array" do
      expect(order.basket).to be_a(Array)
    end
  end

  describe "#add_item" do
    it "raises an error if the choice is not on the menu" do
      expect { order.add(false_choice, quantity) }.to raise_error("Item not on menu")
    end
    it "adds an item x times from the menu hash to the basket array" do
      expect { order.add(choice, quantity) }.to change { order.basket.length }.by quantity
    end
  end

  describe "#get_choice" do
    it "should assign the choice to an instance variable" do
      allow(STDIN).to receive(:gets) { "Test-dish" }
      order.get_choice
      expect(order.choice).to eq choice
    end
  end

  describe "#get_quantity" do
    it "should assign the quantity to an instance variable" do
      allow(STDIN).to receive(:gets) { 2 }
      order.get_quantity
      expect(order.quantity).to eq quantity
    end
  end

end
