require 'menu'
require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:description) { 'yummy food' }
  let(:quantity) { 1 }
  let(:unit_price) { 10 }

  describe '#order_items' do
    it 'a new order should have no order_items' do
      expect(order.order_items.count).to eq(0)
    end
  end

  describe '#confirm_item_quantity' do
    it 'allows the user to confirm the food amount' do
      allow(subject).to receive(:gets).and_return("#{quantity}")
      expect { subject.confirm_item_quantity(description, unit_price) }
        .to change { subject.order_items.count }.by(quantity)
    end
  end

  describe '#total_value' do
    it 'a new order should have zero total value' do
      expect(order.total_value).to eq(0)
    end
  end

  describe '#show' do
    it 'displays the current order details' do

    end
  end
end
