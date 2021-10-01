require "item"

describe Item do
  describe "#initialize" do
    context "when valid arguments given" do

      dish = "bacon and eggs"
      price = 5.66

      it "creates an item with an auto-generated ID" do
        item = described_class.new(dish,price)
        expect(item.id).to eq 1
      end

      it "allows users to store a dish and its price" do
        
        item = described_class.new(dish,price)
        expect(item.dish).to eq(dish)
        expect(item.price).to eq(price)
      end
    end

    context "when invalid arguments given" do
      it "throws an error" do
        expect{ item = described_class.new()}.to raise_error "you must pass a dish and price"
      end
    end
  end
end