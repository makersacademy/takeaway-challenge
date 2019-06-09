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
      expect { order.add(dish, 1)}.to change {order.current_order.count}.by(1)
    end
  end    

end
