require "order"

describe Order do
  let(:order) { Order.new("basket",20) }
  let(:basket) { double(basket) }
  

  it 'should respond to process' do
    expect(order).to respond_to(:process)
  end
  
  context 'total price is incorrect' do
    
    it 'should raise error' do
    
    end
  end



end
