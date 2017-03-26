require 'order'

describe Order do
  let(:menu_item) { double :menu_item }

  describe '#initialize' do
    it 'returns a empty array' do
      expect(subject.ordered_items).to be_empty
    end
  end

  describe '#save_order_items' do
    it 'saves an item to a list' do
      subject.save_order_items(menu_item)
      expect(subject.ordered_items.count).to eq(1)
    end
  end

  describe '#check_order_total' do
    it 'checks the total price of the order' do
      subject.save_order_items(price: '1.50')
      subject.save_order_items(price: '1.50')
      expect(subject.check_order_total(3)).to eq(3)
    end

    it 'raises an error if the order total is incorrect' do
      subject.save_order_items(price: '1.50')
      expect { subject.check_order_total(3) }.to raise_error 'Order total incorrect'
    end
  end
end
