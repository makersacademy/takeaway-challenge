require 'order'

describe Order do
  let(:dish) { double :dish, price: "2.5" }
  let(:dish2) { double :dish, price: "4" }
  let(:dish3) { double :dish, price: "8.99" }

  describe 'initialization' do
    it 'should have an empty items list' do
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'should add selected item to the items list' do
      subject.add_item(dish)
      expect(subject.items).to include dish
    end
    it 'should return the item' do
      expect(subject.add_item(dish)).to eq dish
    end
  end

  describe '#remove_item' do
    it 'should remove selected item from the items list' do
      subject.add_item(dish)
      subject.remove_item(dish)
      expect(subject.items).not_to include dish
    end
  end

  describe '#total' do
    it 'should return the total price of an order' do
      subject.add_item(dish)
      subject.add_item(dish2)
      subject.add_item(dish3)
      prices_total = dish.price.to_f + dish2.price.to_f + dish3.price.to_f
      expect(subject.total).to eq prices_total
    end
  end
end
