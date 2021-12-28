require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { Menu.new({"Soup" => 2, "Bread" => 1}) }

  describe '#add_item' do
    context 'when an item from the menu is added' do
      it 'adds an item(s) and quantity to the basket' do

        order.add_item("Soup", 2)
        order.add_item("Bread", 1)
        expect(order.basket).to eq({"Soup"=>2, "Bread"=>1})
      end
    end

    context 'when an item not on the menu is added' do
      it 'raises an error' do
        expect{ order.add_item("Pizza", 1) }.to raise_error("INVALID SELECTION") 
      end
    end
  end
end
