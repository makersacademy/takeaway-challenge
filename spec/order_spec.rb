require 'order'

describe Order do

  context 'Menu' do
    it 'Should display the default menu' do
      expect(subject.menu).to eq Order::DEFAULT_MENU
    end
  end

  context 'Order' do
    it 'User can order select dishes' do
      subject.select('pizza', 3)
      expect(subject.order).to eq([{ meal: 'pizza', quantity: 3, total: 18 }])
    end

    it 'Returns current total when order is selected' do
      expect(subject.select('pizza', 3)).to eq 'Your order will cost £18'
    end

    it 'returns current total when multiple items are selected' do
      subject.select('pizza', 3)
      expect(subject.select('nuggets', 2)).to eq 'Your order will cost £26'
    end
  end
end
