require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double(:dish_double, :name => 'Pizza', :price => 16, :available? => true) }

  describe '#add_to_order' do
    it "adds an item to the user's order" do
      expect { order.add_to_order(1) }.to change { order.current_items }
    end
  end
  
  describe '#remove_from_order' do
    context 'if item is in current order' do
      it 'removes the item' do
        order.add_to_order(dish)
        expect { order.remove_from_order('Pizza') }.to change { order.current_items }
      end
    end

    context 'if item is not in current order' do
      it 'raises an error' do
        expect { order.remove_from_order(1) }.to raise_error 'No such item in order'
      end
    end
  end

  before do
    order.add_to_order(dish)
    order.add_to_order(dish)
    order.add_to_order(dish)
  end

  describe '#order_total_price' do
    it 'returns the sum of the item prices' do
      expect(order.order_total_price).to eq 48
    end
  end

  describe 'list_order' do
    it 'prints all items in the order' do
      expect { order.list_order }.to output("Pizza - 16\nPizza - 16\nPizza - 16\n").to_stdout
    end
  end
end
