require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu", items: { "Soup" => 2, "Bread" => 1 }) }

  describe '#add_item' do
    context 'when an item from the menu is added' do
      it 'adds an item(s) and quantity to the basket' do

        order.add_item("Soup", 2)
        order.add_item("Bread", 1)
        expect(order.basket).to eq({ "Soup" => 2, "Bread" => 1 })
      end
    end

    context 'when an item not on the menu is added' do
      it 'raises an error' do
        expect { order.add_item("Pizza", 1) }.to raise_error(InvalidSelectionError) 
      end
    end

    context 'when a quantity <= 0 is provided' do
      it 'raises an error' do
        expect { order.add_item("Bread", 0) }.to raise_error(ZeroQuantityError) 
      end
    end
  end

  describe "#calculate_total" do
    it "returns the total of the basket" do
      
      order.add_item("Soup", 2)
      order.add_item("Bread", 1)
      expect(order.calculate_total).to eq(5)
    end
  end

  describe "#calculate_quantity_total" do
    it "returns the total price of an item based on the quantity" do
      
      order.add_item("Soup", 3)
      expect(order.calculate_quantity_total("Soup")).to eq(6)
    end
  end
end
