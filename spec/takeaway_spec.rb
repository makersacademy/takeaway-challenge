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

    it 'will place order if total given matches order total' do
      allow(order).to receive(:place_order) 
      expect(order).to receive(:place_order)
      takeaway.confirm_order_total(total)
    end
  
  end    
  
  describe '#add_to_order' do

    it 'will call add_to_order if dish is on menu' do
      allow(order).to receive(:real_dish?).with(dish) { true }
      expect(order).to receive(:add_to_order).with(dish, 1)
      takeaway.add_to_order(dish) 
    end 
      
  end 
 
  describe '#order_total' do

    it 'will call order total in order' do
      allow(order).to receive(:order_total)
      expect(order).to receive(:order_total)
      takeaway.order_total
    end

  end

end
