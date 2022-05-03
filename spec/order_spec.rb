describe Order do
  subject(:order) { Order.new }
  dishes = [{ pizza: 9.50 }, { pasta: 8.20 }]

  describe '#add_to_basket' do
    it 'should change basket to include dishes' do
      order.add_to_basket(dishes)
      expect(order.basket).to eq(dishes)
    end
  end
  
  describe '#display_basket_total' do
    it 'should return basket dishes and prices and total' do
      order.add_to_basket(dishes)
      expect(order.display_basket_and_total).to eq(dishes => 17.70)
    end
  end

  describe '#complete_order' do
    context 'when basket contains dishes' do
      before(:each) { order.add_to_basket(dishes) }
      
      it 'should change order status to completed' do
        expect { order.complete_order('time') }.to change { 
                                                     order.complete_status
                                                   }.from(false).to(true)
      end

      it 'should not allow a completed order to be completed again' do
        allow(order).to receive(:complete_status).and_return(true)
        expect { order.complete_order('time') }.to raise_error "Order already completed!"
      end
    end

    context 'when basket is empty' do
      it 'should return error when basket is empty' do
        expect { order.complete_order('time') }.to raise_error "No dishes in basket!"
      end
    end
  end
end
