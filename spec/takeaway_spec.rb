require 'takeaway'

describe Takeaway do
  let(:menu)          { double(:menu) }
  let(:order)         { double(:order) }
  let(:order_class)   { double(:order_class, new: order) }
  subject(:takeaway)  { described_class.new(menu, order_class) }

  describe '#view_menu' do
    it 'calls the view_menu method on the menu class' do
      allow(menu).to receive_messages(view_full_menu: true)
      expect(takeaway.view_menu).to be(true)
    end
  end

  describe '#choose' do
    it 'adds selected dish to order' do
      allow(menu).to receive(:select_dish) { 'dish' }
      allow(order).to receive(:add) { ['dish'] }
      expect(takeaway.choose('chicken', 'korma')).to eq(['dish'])
    end
  end

  describe '#view_order_total' do
    it 'returns order total' do
      allow(order).to receive_messages(total: 5.95)
      expect(takeaway.view_order_total).to eq('£5.95')
    end
  end

  describe '#view_order' do
    it 'returns current order as readable string' do
      allow(order).to receive(:view) { true }
      expect(takeaway.view_order).to be(true)
    end
  end

  describe '#complete_order' do
    it 'adds order to order history' do
      expect{ takeaway.complete_order }
        .to change { takeaway.order_history }.to include(order)
    end

    it 'creates a new order' do
      expect(takeaway.complete_order).to eq(order)
    end
  end

end
