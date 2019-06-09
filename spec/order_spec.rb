require 'order'

RSpec.describe Order do
  let(:order) { Order.new }
  let(:dish) { double :dish }
  
  context 'new order' do
    it 'order starts empty' do
      expect(order.current_order).to be_empty
    end

    it 'total price starts 0' do
      expect(order.total).to eq 0
    end
  end

  describe '#add' do
    it 'adds item to current order' do
      expect { order.add(dish, 1) }.to change { order.current_order.count }.by(1)
    end

    it 'adds the price of the item to total' do
      expect { order.add_to_total(5, 2) }.to change { order.total }.by(10)
    end
  end  

  describe '#print_order' do
    it 'print the order' do
      expect(order.print_order).to be_a(String)
    end
  end

end
