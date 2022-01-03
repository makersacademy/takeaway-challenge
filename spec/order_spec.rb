require 'order'

describe Order do
  
  let(:pizza) { double(name: 'pizza', price: 7) }
  let(:pasta) { double(name: 'pasta', price: 15) }
  let(:olives) { double(name: 'olives', price: 2) }
  let(:menu_list) { [pizza, pasta, olives] }
  let(:order) { Order.new(menu_list) }
  
  it 'has an empty order_list when instantiated' do
    expect(order).to have_attributes(order_list: [])
  end

  describe '#add' do
    it 'adds dishes to order_list' do
      order.add('pizza', 2)
      order.add('pasta')
      expect(order.order_list).to include({ pizza => 2 }, { pasta => 1 })
    end
  end

  context 'having added 3 items to order' do
    before :each do
      order.add('pizza', 2)
      order.add('pasta')
      order.add('olives', 10)
    end
    
    describe '#total' do 
      it 'returns total' do
        expect(order.total).to eq 49
      end
    end
  
    describe '#summary' do
      it 'returns breakdown of total' do
        expect(order.summary).to eq "pizza: 7 x 2 = 14\npasta: 15 x 1 = 15\nolives: 2 x 10 = 20"
      end
    end
  
    describe '#finish' do
      before :each do
        #prevents Twilio from sending a message when using rspec
        allow(Message).to receive(:send_confirmation) { true }
      end
      
      it 'sends an sms to confirm order' do
        # does this need to be tested?
      end
    end

    describe '#find_dish' do
      context 'when dish is not on the menu' do
        it 'returns an error' do
          expect { order.add('not_on_menu') }.to raise_error "Not on the menu." 
        end
      end
    end
  end
end
