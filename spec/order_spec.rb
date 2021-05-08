require 'order'

describe Order do

  subject(:order) { described_class.new(menu)}

  let(:menu) {double :menu }

  let(:dishes) do
    {
      pita: 2.50, 
      musaka: 7.99
    }
  end

  context '#add_to_basket' do 

    before do
      allow(menu).to receive(:include?).with(:pita).and_return(true)
      allow(menu).to receive(:include?).with(:musaka).and_return(true)
    end

    it 'can order several dishes from the menu' do
      order.add_to_basket(:pita, 2.50)
      order.add_to_basket(:musaka, 7.99)
      expect(order.dishes).to eq(dishes)
    end

    context 'when dish is not available'
    it 'should raise an error' do
      allow(menu).to receive(:include?).with(:fish).and_return(false)
      expect { order.add_to_basket(:fish) }.to raise_error('The selected dish is not available')
    end
  end 
end 