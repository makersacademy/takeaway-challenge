describe Order do
  subject(:order) { Order.new }

  describe '#add_to_basket' do
    it 'should change basket by dishes chosen' do
      dishes = ['pizza', 'pasta']
      expect { order.add_to_basket(dishes) }.to change { 
        order.basket.length }.by(dishes.length)
    end
  end

  describe '#complete_order' do
    it 'should change complete_status to completed' do
      expect { order.complete_order('time') }.to change { order.complete_status}.from(false).to(true)
    end
  end
end
