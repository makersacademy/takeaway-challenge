require 'order'

describe Order do
  subject(:order) { described_class = Order.new }
  let(:takeaway) { double :takeaway, select_dishes: dishes }
  let(:menu) { {onion_bhaji: 2.95, chicken_tikka_masala: 7.95, naan: 1.95} }
  let(:dishes) { {chicken_tikka_masala: 1, naan: 2} }

  describe '#add' do
    it 'adds dish to basket with specified quantity' do
      order.add(:naan, 2)
      expect(order.basket).to eq ({naan: 2})
    end
  end

  describe '#basket' do
    it 'stores all dishes added' do
      order.add(:chicken_tikka_masala, 1)
      order.add(:naan, 2)
      expect(order.basket).to eq dishes
    end
  end

  describe '#order_total' do
    it 'adds up the total number of dishes' do
      order.add(:chicken_tikka_masala, 1)
      order.add(:naan, 2)
      expect(order.order_total).to eq 3
    end
  end
end