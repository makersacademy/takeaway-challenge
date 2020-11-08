require 'order'

describe Order do
  let(:food1) { double :food, id: 1, item_name: "Soup", item_price: 5 }
  let(:food2) { double :food, id: 2, item_name: "Asparagus", item_price: 2 }
  describe "#add_item" do
    it "adds multiple food items in different quantities" do
      subject.add_item(food1, 5)
      subject.add_item(food2, 3)
      expect(subject.total).to eq(31)
    end
  end

  describe "#empty?" do
    it "returns false if populated" do
      expect(Order.new([food1]).empty?).to eq(false)
    end

    it "returns true if empty" do
      expect(subject.empty?).to eq(true)
    end
  end

  describe "#to_s" do
    it "calls puts on each unique food item with quantity in simplest case" do
      test = Order.new([food1])
      expect(food1).to receive(:to_s)
      expect { puts test }.to output(/Quantity: 1/).to_stdout
    end

    it "follows above in case of 2" do
      test = Order.new([food1, food1])
      expect(food1).to receive(:to_s)
      expect { puts test }.to output(/Quantity: 2/).to_stdout
    end

    it "outputs the total of the current order at the end" do
      test = Order.new([food1, food1])
      expect { puts test }.to output(/Total: £10/).to_stdout
    end

    it "hasn't hardcoded the total!" do
      test = Order.new([food1, food2])
      expect { puts test }.to output(/Total: £7/).to_stdout
    end
  end
end