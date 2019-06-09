require 'order'

RSpec.describe Order do
  let(:order) { described_class.new(menu) }
  let(:menu) { double :Menu, :dishes => dishes_on_menu }
  let(:dishes_on_menu) do {
      spring_rolls: 5,
      wonton: 10,
      congee: 10,
      chow_mein: 15,
      hotpot: 20
    }
  end

  context 'new order' do
    it 'order starts empty' do
      expect(order.current_order).to be_empty
    end
  end

  describe '#current_order' do
    it 'adds a dish to the order' do
      order.add(:wonton, 2)
      order.add(:congee, 3)
    end
  end

  describe '#add' do
    it 'raises error if item is not available' do
      expect { order.add(:pizza, 10) }.to raise_error "Item is not available"
    end


    it 'adds item to current order' do
      expect { order.add(:congee, 1) }.to change { order.current_order.count }.by(1)
    end
  end

  describe '#total_order' do
    it 'shows the total order' do
      dish = :wonton
      quantity = 2
      total = 20
      message = "Your total order is £%.2f" % [total]
      expect(order.total_order(dish, quantity)).to eq(message)
    end
  end
end
