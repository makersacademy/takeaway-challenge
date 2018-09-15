require "menu"

describe Menu do
  context "#see" do
    let(:menu) { described_class.new }
    it "prints out menu" do
      expect { menu.see }.to output.to_stdout
    end
  end

  context "#choose" do
    let(:order_double) { double :Order_Double, add: "Dish added to order" }
    let(:menu) { described_class.new(order_double) }
    it "adds dish to order" do
      expect(menu.choose("Butterbeer")).to eq("Dish added to order")
    end
  end
end
