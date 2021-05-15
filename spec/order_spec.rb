require 'order'

describe Order do

  subject(:order) { described_class.new(menu)}

  let(:menu) { double :menu }

  let(:basket) do
    {
      pita: 3, 
      musaka: 2
    }
  end

  describe '#checkout' do 

    before do
      allow(menu).to receive(:include?).with(:pita).and_return(true)
      allow(menu).to receive(:include?).with(:musaka).and_return(true)
      allow(menu).to receive(:[]).with(:pita).and_return(2.50)
      allow(menu).to receive(:[]).with(:musaka).and_return(7.99)
    end

  context '#add to basket' do 
    it 'can order several dishes from the menu' do
      order.select(:pita, 3)
      order.select(:musaka, 2)
      expect(order.basket).to eq(basket)
    end

    context 'when dish is not available' do 
      it 'should raise an error' do
        allow(menu).to receive(:include?).with(:fish).and_return(false)
        expect { order.select(:fish) }.to raise_error('Fish is not on the menu.')
      end
  end

    it 'allows you to view order summary' do
      message = "This is your order summary:\n3 x pita: Unit price: £2.50, Total: £7.50.\n2 x musaka: Unit price: £7.99, Total: £15.98.\nOrder total: £23.48\n"
      order.select(:pita, 3)
      order.select(:musaka, 2)
      expect { order.checkout_view }.to output(message).to_stdout
    end
  end

    it 'calculates the order total' do
      order.select(:pita, 3)
      order.select(:musaka, 2)
      expect(order.total).to eq(23.48)
    end
  end
end 