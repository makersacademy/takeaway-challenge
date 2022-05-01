describe Order do
  subject(:order) { Order.new }
  dish1 = {'pizza': 9.50}
  dish2 = {'pasta': 8.20}

  describe '#add_to_basket' do
    it 'should change basket to include dishes' do
      order.add_to_basket(dish1, dish2)
      expect(order.basket).to include(dish1, dish2)
    end
  end
  
  describe '#display_basket_and_total' do
    xit 'should return basket dishes and prices and total' do
      order.add_to_basket(dish1, dish2)

      expect(order).to receive(:basket_dishes)
      order.display_basket_and_total
    end
  end

  describe '#complete_order' do
    context 'when basket contains dishes' do
      it 'should change order status to completed' do
        order.add_to_basket(dish1, dish2)

        expect { order.complete_order('time') }.to change { 
          order.complete_status }.from(false).to(true)
      end

      it 'should set time order completed'

      it 'should set estimated delivery time'
    end

    context 'when basket is empty' do
      it 'should return error when basket is empty' do
        expect { order.complete_order('time') }.to raise_error "No dishes in basket!"
      end
    end
  end
end
