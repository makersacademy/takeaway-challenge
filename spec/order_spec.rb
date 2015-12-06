require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:menu) {double(:menu, dishes: dishes)}
  let(:dishes) { {burger: 3, chips: 2, drink: 1} }

  describe '#add' do
    it 'holds the name and quantity of a dish in the basket' do
      order.add("burger", 2)
      expect(order.basket).to include("burger" => 2)
    end
  end

  describe '#overview' do
    it 'should return an empty basket if basket is empty' do
      expect(order.overview).to eq 'Basket is empty'
    end
  end

  describe '#checkout' do
    it 'should return an empty basket when empty' do
      order.add(:burger, 3)
      expect(order.overview).to include 'burger x3: £0'
    end
    it 'should return the message wrong total' do
      order.add(:burger, 3)
      expect(order.checkout(2)).to eq 'Wrong total'
    end
  end

  describe '#reset' do
    it 'should empty the basket' do
      order.add(:burger, 3)
      order.reset
      expect(order.basket).to be_empty
    end
  end

end
