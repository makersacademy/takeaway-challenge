require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:dish) { double :dish, name: 'wings', price: 7 }
  let(:dish2) { double :dish2, name: 'chicken', price: 5 }

  describe '#add_product' do
    it 'raises and error if dish not on menu' do
      allow(menu).to receive(:contain_dish?).with('pizza').and_return(false)
      expect { order.add_product('pizza', 2) }.to raise_error 'pizza is not on the menu'
    end

    it 'adds the desired products from the menu' do
      allow(menu).to receive(:contain_dish?).with('wings').and_return(true)
      allow(menu).to receive(:select_dish).with('wings').and_return(dish)
      order.add_product('wings', 2)
      expect(order.cart).to eq({ 'wings' => 2 })
    end
  end

  describe '#total' do
    it 'return the order total' do
      allow(menu).to receive(:contain_dish?).with('wings').and_return(true)
      allow(menu).to receive(:select_dish).with('wings').and_return(dish)
      order.add_product('wings', 2)
      allow(menu).to receive(:contain_dish?).with('chicken').and_return(true)
      allow(menu).to receive(:select_dish).with('chicken').and_return(dish2)
      order.add_product('chicken', 1)
      expect(order.total).to eq 19.00
    end
  end
end
