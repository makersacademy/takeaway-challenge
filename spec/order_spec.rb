require 'order'

describe Order do
  let(:dish1) { double :dish1, name: "Dish 1", price: 5 }
  let(:dish2) { double :dish2, name: "Dish 2", price: 10 }

  it { is_expected.to respond_to(:dishes_ordered) }

  context 'when passed 2 dishes' do
    subject { Order.new(dish1, dish2) }

    it 'saves both dishes in the order' do
      expect(subject.dishes_ordered).to include(dish1, dish2)
    end

    it 'calculates a total from the list of dishes' do
      expect(subject.total).to eq(dish1.price + dish2.price)
    end

    it 'customer can check the total calculation and view their order' do
      expect(subject.check_order).to include(dish1.price.to_s, dish2.price.to_s, subject.total.to_s)
    end
  end
end
