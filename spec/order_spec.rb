require 'order'

describe Order do
  context "#add" do
    let(:price_double) { double :Price_Double, total_cost: 132 }
    let(:order) { described_class.new(price_double) }
    it "adds dish to @order" do
      selected_dish = { name: "Butterbeer", price: 3, quantity: 44 }
      return_string = "\n\n\nCurrent order:\n\n44 Butterbeer\n\nTotal: 132 silver sickles\n\n\n\n"
      expect { order.add(selected_dish) }.to output(return_string).to_stdout
    end
  end

  context "#confirm" do
    let(:price_double) { double :Price_Double, confirm: true }
    let(:order) { described_class.new(price_double) }
    it "calls Price#confirm" do
      expect(order.confirm(0)).to eq(true)
    end
  end
end
