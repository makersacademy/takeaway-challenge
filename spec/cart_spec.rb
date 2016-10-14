require "spec_helper"

describe Cart do
  let(:menu) { Menu.new }
  let(:dish) {double(:dish)}

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

  describe '#is_empty?' do
    it 'returns true if the cart is empty' do
      expect(subject.is_empty?).to eq true
    end
    it 'returns false if the cart is NOT empty' do
      subject.add(:dish)
      expect(subject.is_empty?).to eq false
    end
  end

  describe '#total' do
    before do
      dish1 = {dish: 'chips', price: 1.0, quantity: 2}
      dish2 = {dish: 'fish', price: 1.5, quantity: 1}
      subject.add(dish1)
      subject.add(dish2)
    end

    it 'returns the total of the cart' do
      expect(subject.total).to eq("Your total is £3.50")
    end
  end
end
