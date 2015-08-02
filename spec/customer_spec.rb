require 'customer'
describe Customer do

  it { expect(subject).to respond_to(:show_menu) }
	  
  describe '#ordering' do
    it 'should take an order for food with 2 arguments' do
      expect(subject).to respond_to(:order_item).with(2).argument
    end

    it { expect(subject).to respond_to(:view_order) }
    
    it 'should display correct order' do
      subject.order_item("burger", 2)
      expect(subject.view_order).to eq [{"burger"=>4}, {"burger"=>4}]
    end
    
    it 'should give correct price' do
      subject.order_item("burger", 2)
      expect(subject.order_price).to eq ("The cost for your order is £8.0")
    end
    
    it 'should raise an error if placing empty order' do
	    expect{subject.place_order}.to raise_error "You haven't ordered any food"
    end
  end 
end  