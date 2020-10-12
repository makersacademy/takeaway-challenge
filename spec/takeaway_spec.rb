require './lib/takeaway'

describe Takeaway do 
  let(:menu) { double :menu}
  let(:order) { double :order}

  describe '#show_menu' do    
    it 'can show a menu of items' do      
      allow(menu).to receive(:show) { menu }
      subject.show_menu 
    end  
  end

  describe '#view' do    
      it 'can show an order' do       
        allow(order).to receive(:view) { order }      
        subject.show_order
      end  
    end

  # describe '#place_order' do
  #   it 'allows customer to place order' do
  #     allow(order).to receive(send)
  #   end
#   end
end