require 'order'

describe Order do
  let(:menu) do
    menu = double(:menu)
    allow(menu).to receive(:contents) { { "Horse Burger" => 8.99 } }
    menu
  end

  let(:order) { described_class.new(menu) }

  describe 'Initialization' do
    it { is_expected.to respond_to :basket }

    context 'Order basket' do
      it 'is an array' do
        expect(order.basket).to be_a Array
      end

      it 'is empty when initialized' do
        expect(order.basket).to be_empty
      end
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }
  end

  context 'Adding menu items to the order' do
    it 'adds the selected item when found' do
      order.add("Horse Burger")
      expect(order.basket).to include("Horse Burger" => 8.99)
    end

    it 'informs the user the item has been added' do
      expect(order.add("Horse Burger")). to eq "Horse Burger (8.99) has been added to your basket."
    end
  end

  context 'Adding non-existant items' do
    it 'raises an error' do
      expect { order.add("Chicken Burger") }.to raise_error("Chicken Burger not found")
    end
  end
end

# Move dishes into a hash in the menu
# Add an Order class that has a basket
# - Order.add(item_name)
# - Order.basket - shows basket contents
# - Order.confirm - marks the order as acceptable
# - Order.submit - sends the text
