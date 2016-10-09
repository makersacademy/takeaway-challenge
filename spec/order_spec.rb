require 'order'

describe Order do
  let(:dish) { double :dish, price: "2.5" }
  let(:dish2) { double :dish, price: "4" }
  let(:dish3) { double :dish, price: "8.99" }
  let(:order_item) { {item: dish, quantity: 1} }

  describe 'initialization' do
    it 'should have an empty items list' do
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'should add selected item to the items list' do
      subject.add_item(dish, 1)
      expect(subject.items).to include order_item
    end
    it 'should return the order item' do
      expect(subject.add_item(dish, 1)).to eq order_item
    end
  end

  context 'ordering 3 different dishes' do
    before do
      subject.add_item(dish, 1)
      subject.add_item(dish2, 3)
      subject.add_item(dish3, 1)
    end

    describe '#remove_item' do
      it 'should remove selected item from the items list' do
        subject.remove_item(dish, 1)
        expect(subject.items).not_to include order_item
      end

      it 'should update selected items quantity' do
        subject.remove_item(dish2, 1)
        updated_dish2_item = { item: dish2, quantity: 2 }
        expect(subject.items).to include updated_dish2_item
      end
    end

    describe '#total' do
      it 'should return the total price of an order' do
        subject.remove_item(dish2, 1)
        prices_total = dish.price.to_f + dish2.price.to_f * 2 + dish3.price.to_f
        expect(subject.total).to eq prices_total
      end
    end

  end
end
