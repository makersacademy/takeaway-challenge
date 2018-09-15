require 'order'

describe Order do
  context "#add" do
    let(:order) { described_class.new }
    it "adds dish to @order" do
      selected_dish = { name: "Butterbeer", price: 3, quantity: 44 }
      return_string = "\n\n\nCurrent order:\n\n44 Butterbeer\n\nTotal: 132 silver sickles\n\n\n\n"
      expect { order.add(selected_dish) }.to output(return_string).to_stdout
    end
  end

  context "#confirm" do
    let(:order) { described_class.new }
    it "checks whether there has been a miscalculation" do
      expect { order.confirm(16) }.to raise_error(PriceError)
    end
  end
end
