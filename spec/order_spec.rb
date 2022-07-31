require 'order'

describe Order do
    subject { described_class.new(maximum_order: 5) }
    let(:cake) { double :dish, price: 3.60 }
    let(:cheese_cake) { double :dish, price: 2.50 } 

    it 'has a maximum order value' do
        expect(subject.maximum_order).to eq 5
    end

    it 'knows how many of each item are in the order' do
        subject.add_dish(cake, 1)
        expect(subject.orders).to include(cake)
    end

    it 'knows how many of each item is in the order' do
        subject.add_dish(cake, 4)
        subject.add_dish(cheese_cake, 1)
        expect(subject.item_count).to eq(5)
    end

    it 'can calculate the total of an order' do
        subject.add_dish(cake, 4)
        subject.add_dish(cheese_cake, 1)
        expect(subject.order_total).to eq(16.90)
    end

    it 'shows a list of all orders' do
        subject.add_dish(cake, 4)
        expect(subject.display_current_order).to include(cake)
    end
end