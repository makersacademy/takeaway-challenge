require 'order'

describe Order do
  let(:Order) {described_class}
  subject(:order) { described_class.new(menu_class, sms_class) }
  let(:menu_class) { double :menu_class, new: menu }
  let(:menu) { double :menu }
  let(:sms_class) { double :sms }
  let(:sms) { double :sms }
  let(:dish) { double :dish }
  let(:dish2) { double :dish }   
  let(:quantity) { double :quantity }

  describe '#initialize' do
  
    it 'creates an instance of menu_class' do
      expect(menu_class).to receive(:new)
      order
    end 
      
  end

  describe '#add_to_order' do
  
    it 'is expect to call push_to_current_order with the two parameters received' do
      allow(order).to receive(:push_to_current_order).with(dish, quantity) 
      expect(order).to receive(:push_to_current_order).with(dish, quantity) 
      order.add_to_order(dish, quantity)
    end
    
  
  end
  
  describe '#see_dishes' do
   
    it 'will display a hash of dishes and prices' do
      allow(menu).to receive(:see_dishes).and_return Hash.new
      expect(order.see_dishes.class).to eq Hash
    end
  
  end

  describe '#real_dish' do

    it 'will call on menu to check dish' do
      allow(menu).to receive(:check_dish).with(dish)
      expect(menu).to receive(:check_dish).with(dish)
      order.real_dish?(dish)
    end
  
  end

  describe '#place_order' do
    
    it 'will create a new instance of sms class' do
      allow(sms).to receive(:send_order_confirmation)
      allow(sms_class).to receive(:new).and_return(sms)
      expect(sms_class).to receive(:new)
      order.place_order
    end
    
  end
  
  describe '#order_total' do
  
    it 'will return the result of calculate_order_total' do 
      allow(order).to receive(:calculate_order_total).and_return(5)
      expect(order.order_total).to eq 5
    end
  
#    it 'will correctly calculate the price of the order' do
#      allow(order).to receive(:current_order).and_return(dish, dish2)
#      allow(menu).to receive(:dish_price).with(dish).and_return(4)
#      allow(menu).to receive(:dish_price).with(dish).and_return(6)
#      expect(order.order_total).to eq 
#    end
  
  end

  describe 'place_order'

    it 'will call on send_order_confirmation in sms class' do
      allow(sms).to receive(:send_order_confirmation)
      allow(sms_class).to receive(:new).and_return(sms)
      expect(sms).to receive(:send_order_confirmation)
      order.place_order
    end

    it 'will call create a new sms' do
      allow(sms).to receive(:send_order_confirmation)
      allow(sms_class).to receive(:new) { sms }
      expect(sms_class).to receive(:new)
      order.place_order

    end

  end 
      

