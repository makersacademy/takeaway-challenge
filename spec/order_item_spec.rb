require_relative './lib/order_item'

describe OrderItem do
  let(:description) { 'yummy food' }
  let(:quantity) { 1 }
  let(:unit_price) { 10 }
  subject(:order_item) { described_class.new(description, unit_price) }

  describe '#alter_quantity' do
    it 'increases item quantity by expected amount' do
      expect { order_item.alter_quantity(quantity) }
        .to change { order_item.quantity }.by(quantity)
    end
    it 'decreases item quantity by expected amount' do
      order_item.alter_quantity(quantity)
      expect { order_item.alter_quantity(-quantity) }
        .to change { order_item.quantity }.by(-quantity)
    end
    it 'raises error if item quantity is reduced by more than item quantity' do
      expect { order_item.alter_quantity(-quantity - 1) }
        .to raise_error 'Cannot reduce below zero - no alteration made'
    end
  end

  describe '#value' do
    it 'returns the value of this order item' do
      expect(order_item.value).to eq(order_item.quantity * order_item.unit_price)
    end
  end
end
