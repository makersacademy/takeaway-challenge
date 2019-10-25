require 'takeaway'

describe Takeaway do
    it 'creates an instance of the takeaway class' do
        expect(subject).to be_an_instance_of(Takeaway)
    end

    it 'returns the list of items on the menu' do
        expect(subject.show_menu).to include(
            { item: 'Chips', price: 1.00 },
            { item: 'Burger', price: 1.50 },
            { item: 'Chicken', price: 1.50 },
            { item: 'Kebab', price: 3.00 }
        )
    end

    it 'has an empty array of order to start with' do
        expect(subject.order).to be_empty
    end

    it 'adds item to array of order' do
        subject.order_item("Chips")
        expect(subject.order).to include({:item=>"Chips", :price=>1.0})
    end

    it 'adds item to array of order certain num of times' do
        subject.order_item("Chips", 2)
        expect(subject.order).to eq([
            {:item=>"Chips", :price=>1.0},
            {:item=>"Chips", :price=>1.0}
        ])
    end

    it 'can add multiple items to the order array' do
        subject.order_item("Chips", 2)
        subject.order_item("Burger", 2)
        expect(subject.order).to eq([
            {:item=>"Chips", :price=>1.0},
            {:item=>"Chips", :price=>1.0},
            {:item=>"Burger", :price=> 1.50},
            {:item=>"Burger", :price=> 1.50}
        ])
    end

    it 'start with an empty array of price' do
        expect(subject.price).to be_empty
    end

    it 'adds prices from order to price array' do
        subject.order_item("Chips")
        subject.order_sum
        expect(subject.price).to eq(1.0)
    end

    it 'can get the sum of items in the order array' do
        subject.order_item("Chips")
        subject.order_item("Burger")
        expect(subject.order_sum).to eq(2.50)
    end
end