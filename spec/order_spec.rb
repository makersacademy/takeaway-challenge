require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:menu) { double :menu }
  let(:menu_item) { "Cheese Burger" }

  describe '#initialize' do
    it 'with an empty order' do
      expect(order.current_order).to be_empty
    end
    it 'with zero as the total' do
      expect(order.total).to eq 0
    end
  end

  describe '#add' do
    it 'prevents item from being added to order if not on menu' do
      non_menu_item = "Chicken Burger"
      allow(menu).to receive(:item?).with(non_menu_item).and_return(false)
      expect { order.add(non_menu_item) }.to raise_error(RuntimeError)
    end
    it 'adds an item to the order' do
      allow(menu).to receive(:item?).with(menu_item).and_return(true)
      order.add(menu_item)
      expect(order.current_order).to include menu_item 
    end      
  end

  describe '#show_total' do
    it 'formats and displays the order total' do
      expected_output = "Order Total: £9.00\n"
      allow(menu).to receive(:price).with(menu_item).and_return(9.00)
      order.add(menu_item)
      expect { order.show_total }.to output(expected_output).to_stdout
    end
  end
  
end
