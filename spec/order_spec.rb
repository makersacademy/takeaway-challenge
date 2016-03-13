require 'order'

describe Order do
  let(:Order) {described_class}
  subject(:order) { described_class.new(menu_class) }
  let(:menu_class) { double :menu_class, new: menu }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
  let(:total) { double :total }

  describe '#initialize' do
  
    it 'creates an instance of menu_class' do
      expect(menu_class).to receive(:new)
      order
    end 
      
  end

  describe '#add_to_order' do
     
    it 'will call push_to_current_order with the two parameters received' do
      allow(menu).to receive(:check_dish).with(dish) { true }
      allow(order).to receive(:push_to_current_order).with(dish, quantity) 
      expect(order).to receive(:push_to_current_order).with(dish, quantity) 
      order.add_to_order(dish, quantity)
    end
    
    it 'will raise error if dish is not on menu' do
      allow(menu).to receive(:check_dish).with(dish) { false }
      expect { order.add_to_order(dish, quantity) }.to raise_error(Order::INVALID_DISH_ERR)       
    end

  end
  
  describe '#see_dishes' do
   
    it 'will display a hash of dishes and prices' do
      allow(menu).to receive(:see_dishes).and_return Hash.new
      expect(order.see_dishes.class).to eq Hash
    end
  
  end

  describe '#order_total' do
  
    it 'will return the result of calculate_order_total' do 
      allow(order).to receive(:calculate_order_total).and_return(5)
      expect(order.order_total).to eq 5
    end
  
  end

  describe '#place_order' do
    
    context 'when total given is correct' do
      before(:each) { allow(order).to receive(:correct_total?).with(total) { true } }
      

      it 'will call create a new sms' do
        allow(sms).to receive(:send_order_confirmation)
        allow(sms_class).to receive(:new) { sms }
        expect(sms_class).to receive(:new)
        order.place_order(total)

      end

    end
    context 'when total given is incorrect' do
      it 'will raise error' do
        allow(order).to receive(:correct_total) { false }
        expect { order.place_order(total) }.to raise_error Order::WRONG_TOTAL_ERR
    
      end
 
    end      
 
  end
      
end
