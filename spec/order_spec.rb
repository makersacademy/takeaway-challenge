require 'order'

describe Order do
  let(:dish) { double(:dish) }
  subject(:new_order) { described_class.new }
  subject(:complete_order) { new_order.add(dish) }

  describe '#view' do
    it 'starts with no dishes added' do
      expect(new_order.view).to eq []
    end
    # it displays dishes in the order
    # it displays the total
  end

  describe '#add' do
    it 'user can add dishes to an order' do
      expect(complete_order).to include(dish)
    end
    context 'when not on menu' do
      it 'user will see error' do
        expect(new_order.add(dish)).to raise("I'm sorry, that dish is not on our menu")
      end
    end
    context 'when unavailable' do
      it 'user will see error' do
        expect(new_order.add(dish)).to raise("I'm sorry, that dish is currently unavailable")
      end
    end
  end
  # will fail if dish not on menu

  # will fail if dish not available
end
