require "order.rb"

describe Order do

  subject(:order)  { described_class.new }
  let(:pepperoni) { instance_double("Dish") }
  let(:hawaiian) { instance_double("Dish") }
  let(:meat_feast) { instance_double("Dish") }

  describe "#initialize" do
    it { is_expected.to respond_to(:dishes) }
    it "creates an empty dishes hash" do
      expect(order.dishes).to be_empty
    end
    it "sets order total to 0" do
      expect(order.total).to be_zero
    end
  end

  describe "#add_dish" do
    before(:each) do
      order.add_dish(pepperoni, 3)
    end
    it "adds a dish as a key to dishes hash" do
      expect(order.dishes).to have_key(pepperoni)
    end
    it "adds quantity as a value to dish key" do
      expect(order.dishes[pepperoni]).to eq 3
    end
  end

  describe "#expected_total" do
    it { is_expected.to respond_to(:expected_total).with(1).argument }
    it "saves expected total to @total" do
      order.expected_total(5)
      expect(order.total).to eq 5
    end
  end

end
