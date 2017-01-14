require "order.rb"

describe Order do

  let(:pepperoni) { instance_double("Dish") }
  let(:hawaiian) { instance_double("Dish") }
  let(:meat_feast) { instance_double("Dish") }
  let(:menu) { instance_double("Menu") }
  subject(:order)  { described_class.new(menu) }

  describe "#initialize" do
    it "saves the menu to @menu" do
      expect(order.menu).to eq menu
    end
    it "creates an empty ordered dishes hash" do
      expect(order.ordered_dishes).to be_empty
    end
    it "sets order total to 0" do
      expect(order.expected_order_total).to be_zero
    end
  end

  describe "#add_dish" do
    before(:each) do
      allow(menu).to receive(:dishes) { [pepperoni, hawaiian, meat_feast] }
      order.add_dish(1, 3)
    end
    it "adds a dish as a key to dishes hash" do
      expect(order.ordered_dishes).to have_key(pepperoni)
    end
    it "adds quantity as a value to dish key" do
      expect(order.ordered_dishes[pepperoni]).to eq 3
    end
  end

  describe "#expected_total" do
    it { is_expected.to respond_to(:expected_total).with(1).argument }
    it "saves expected total to @expected_total" do
      order.expected_total(5)
      expect(order.expected_order_total).to eq 5
    end
  end

end
