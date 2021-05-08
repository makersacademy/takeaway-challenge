require 'order'

describe Order do

  subject(:order) { described_class.new(menu)}

  let(:menu) {double :menu }

  let(:dishes) do
    {
      pita: 3, 
      musaka: 2
    }
  end

  describe '#checkout' do 

  before do
    allow(menu).to receive(:include?).with(:pita).and_return(true)
    allow(menu).to receive(:include?).with(:musaka).and_return(true)
    allow(menu).to receive(:price).with(:pita).and_return(2.50)
    allow(menu).to receive(:price).with(:musaka).and_return(7.99)
  end

    context '#add to basket' do 
      it 'can order several dishes from the menu' do
        order.add_to_basket(:pita, 3)
        order.add_to_basket(:musaka, 2)
        expect(order.dishes).to eq(dishes)
      end

      context 'when dish is not available' do 
        it 'should raise an error' do
          allow(menu).to receive(:include?).with(:fish).and_return(false)
          expect { order.add_to_basket(:fish) }.to raise_error('The selected dish is not available')
        end
      end
    end

    it 'calculates the order total' do
      order.add_to_basket(:pita, 3)
      order.add_to_basket(:musaka, 2)
      expect(order.total).to eq(23.48)
    end
  end
end 