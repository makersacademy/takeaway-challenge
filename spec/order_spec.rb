describe Order do
  subject(:order) { Order.new }

  describe 'add_to_basket' do
    it 'should change basket by dishes chosen' do
      dishes = ['pizza', 'pasta']
      expect { order.add_to_basket(dishes) }.to change { order.basket.length }.by(dishes.length)
    end
  end
end
