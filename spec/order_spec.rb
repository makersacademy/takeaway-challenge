require 'order'

describe Order do
  subject(:order) { described_class.new(menu_class) }
  let(:menu_class) { double :menu_class, new: menu }
  let(:menu) { double :menu }


  context 'when given a valid dish' do
    before(:each) do  
        allow(menu).to receive(:dish_price).with("pasta") { 5 } 
        allow(menu).to receive(:check_dish).with("pasta") { true } 
        order.add_to_order("pasta", 2)
    end

    describe '#order_total' do
      it 'will return the result of calculate_order_total' do 
        expect(order.order_total).to eq 10
      end
  
    end

  describe '#place_order' do
    
    context 'when total given is incorrect' do
    
      it 'will raise error' do
        expect { order.place_order(11) }.to raise_error Order::WRONG_TOTAL_ERR
      end
 
    end      
 
    context 'when total is correct' do
      
      it 'will not raise error' do
        expect { order.place_order(10) }.not_to raise_error
      end

    end

  end 
  end  
      it 'will raise error if dish is not on menu' do
        allow(menu).to receive(:check_dish).with("cheeseburger") { false }
        expect { order.add_to_order("cheeseburger", 2) }.to raise_error(Order::INVALID_DISH_ERR)       
      end
  
      describe '#see_dishes' do
   
    it 'will display a hash of dishes and prices' do
      allow(menu).to receive(:see_dishes).and_return Hash.new
      expect(order.see_dishes.class).to eq Hash
    end

  end

end
