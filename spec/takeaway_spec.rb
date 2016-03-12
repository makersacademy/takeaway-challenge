require 'takeaway'

describe Takeaway do
  let(:Takeaway) { described_class }
  subject(:takeaway) { described_class.new }
  let(:order_class ) { double :order_class }
  let(:order) { double :order }

  #  it 'will create a new instance of menu_klass' do
   #   expect(subject).to receive(:history)
    #  subject.see_dishes
  #  end


  describe '#see_dishes' do
    
    it { is_expected.to respond_to(:see_dishes) }

  #  it 'will let me see a list of dishes with prices' do
   #   expect(order).to receive(:see_dishes)
    #  takeaway.see_dishes
 # end
    
  end
 
  describe '#order_total' do
    
    it 'will call on order total' do
      expect(order).to receive(:order_total)
      takeaway.order_total
    end
  
  end

end

#  describe '#add_to_order' do
 #   it 'creates an order' do
  #  expect(order).to receive(:new)
   # takeaway.add_to_order("fish", 2)
  #  end
   # end

    

