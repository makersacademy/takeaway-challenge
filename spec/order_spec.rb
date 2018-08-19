require 'order'

describe Order do

  let(:menu) { double :menu, dishes: { 'item-1' => 2, 'item-2' => 3 } }
  let(:new_order) { Order.new(menu) }

  it 'creates an order' do
    expect(described_class).to respond_to(:new)
  end

  describe '#add_item' do
    it 'adds items to the order' do
      subject.add_item('item-1', 2)
      subject.add_item('item-2', 3)
      expect(subject.order.to_a.flatten.join ', ').to eq 'item-1, 2, item-2, 3'
    end
  end

  describe '#update_price' do
    it 'totals the price of the order' do
      new_order.add_item('item-1', 2)
      new_order.add_item('item-2', 3)
      expect{new_order.update_price}.to change{new_order.price}.by(13)
    end
  end

  describe '#pay' do
    it 'raises an error if incorrect amount given' do
      expect { subject.pay(10) }.to raise_error('You must give the exact amount.')
    end
  end

end
