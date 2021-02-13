require 'order'

describe Order do
  let(:dish) { double(:dish) }
  let(:menu) { double(:menu, :check => :present) }
  subject(:new_order) { described_class.new }
  subject(:complete_order) { new_order.add(menu, dish) }

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
    context 'when dish not on menu' do
      it 'user will see error' do
        menu = double(:menu, :check => :not_on_menu)
        expect { new_order.add(menu, dish) }.to output(/I'm sorry, that dish is not on our menu/).to_stdout
      end
    end
    context 'when dish unavailable' do
      it 'user will see error' do
        menu = double(:menu, :check => :unavailable)
        expect { new_order.add(menu, dish) }.to output(/I'm sorry, that dish is currently unavailable/).to_stdout
      end
    end
  end
  # will fail if dish not on menu

  # will fail if dish not available
end
