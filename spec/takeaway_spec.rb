require 'takeaway'

describe Takeaway do
  let(:Takeaway) { described_class }
  subject(:takeaway) { described_class.new(order_class) }
  let(:order_class ) { double :order_class, new: order }
  let(:order) { double :order }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
  let(:total) { double :total }
  let(:wrong_total) { double :wrong_total }

  describe '#initialize' do

    it 'will create a new instance of order' do
      expect(order_class).to receive(:new)
      takeaway
    end

  end

  describe '#see_dishes' do

    it 'will let you see all dishes' do
      expect(order).to receive(:see_dishes)
      takeaway.see_dishes
    end
  
  end

  describe '#confirm_order_total' do
    
    it 'will raise error if total given does not match order total' do
      allow(order).to receive(:order_total) { total }
      expect{ takeaway.confirm_order_total(wrong_total) }.to raise_error(Takeaway::WRONG_TOTAL_ERR)
    end  
  
  end

  
  
    it 'will place order if total given matches order total' do
      allow(takeaway).to receive(:order_total_correct?).with(total) { true }  
      allow(order).to receive(:place_order) 
      expect(order).to receive(:place_order)
      takeaway.confirm_order_total(total)
    end
 
      
   describe 'add_to_order' do

    it 'will raise error if dish is not on menu' do
      allow(order).to receive(:real_dish?).with(dish) { false }
      expect{ takeaway.add_to_order(dish) }.to raise_error(Takeaway::INVALID_DISH_ERR)
    end
 
    it 'will call add_to_order if dish is on menu' do
      allow(order).to receive(:real_dish?).with(dish) { true }
      expect(order).to receive(:add_to_order).with(dish, 1)
      takeaway.add_to_order(dish) 
    end 
      
  end 
 
end

    

