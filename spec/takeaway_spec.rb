require 'takeaway'

describe Takeaway do
  let(:Takeaway) { described_class }
  subject(:takeaway) { described_class.new(order_class) }
  let(:order_class ) { double :order_class, :new => order }
  let(:order) { double :order }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
  let(:total) { double :total }
  let(:wrong_total) { double :wrong_total }

  it 'will create a new instance of order' do
    expect(order_class).to receive(:new)
    takeaway
  end     

  describe '#see_dishes' do

    it 'will let you see all dishes' do
      expect(order).to receive(:see_dishes)
      takeaway.see_dishes
    end
  
  end

  describe '#confirm_order_total' do
    
    it 'will raise error it total given does not match order total' do
      allow(takeaway).to receive(:order_total_correct?).with(wrong_total) { false }
      allow(takeaway).to receive(:order_total) { total }
      expect{ takeaway.confirm_order_total(wrong_total) }.to raise_error("That is not correct, actual total = £" + total.to_s)
    end  
  end

  describe '#add_to_order' do
  
    it 'will call order with add_to_order with the dish and quantity received' do
      allow(takeaway).to receive(:order_total_correct?).with(total) { true }  
      allow(order).to receive(:place_order) { total }
      expect(order).to receive(:place_order)
      takeaway.confirm_order_total(total)
  end
    
end 
 
  describe '#order_total' do
    
    it 'will call on order total' do
      expect(order).to receive(:order_total)
      takeaway.order_total
    end
  
  end

end

    

