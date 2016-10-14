require "spec_helper"

describe Cart do
  let(:menu) { Menu.new }
  let(:dish) {double(:dish)}
  let(:dish1) { double(:dish, price: 1.00, quantity: 1) }
  let(:dish2) { double(:dish, price: 1.50, quantity: 2) }

  describe '#in_cart?' do
    it 'checks if an item has been added to the cart' do
      subject.add(:dish)
      expect( subject.in_cart?(:dish) ).to eq true
    end
  end

  describe '#add' do
    #this is the same as the in cart test >.< how can I test these independently?
    it 'adds item to list of selected items' do
      subject.add(:dish)
      expect( subject.in_cart?(:dish) ).to eq true
    end
  end

  describe '#check' do
    it 'also returns current order' do
      subject.add(:dish)
      expect(subject.check).to eq [:dish]
    end
  end

  describe '#total' do
    it 'returns the total of the cart' do
      subject.add(:dish1)
      subject.add(:dish2)
      expect(subject.total).to eq(3.5)
    end
  end
end
