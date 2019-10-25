require 'takeaway'

describe Takeaway do
    it 'creates and instance of the takeaway class' do
        expect(subject).to be_an_instance_of(Takeaway)
    end

    it 'returns the list of items on the menu' do
        expect(subject.show_menu).to include(
            "Chips" => 1.00,
            "Burger" => 1.50,
            "Chicken" => 1.50,
            "Kebab" => 3.00
        )
    end

    it 'has an empty array of order to start with' do
        expect(subject.order).to be_empty
    end

    it 'adds item to array of order' do
        subject.order_item("Chips")
        expect(subject.order).to include("Chips" => 1.0)
    end

    it 'adds item to array of order certain num of times' do
        subject.order_item("Chips", 2)
        expect(subject.order).to eq([
            {"Chips" => 1.0},
            {"Chips" => 1.0}
        ])
    end

    it 'can add multiple items to the order array' do
        subject.order_item("Chips", 2)
        subject.order_item("Burger", 2)
        expect(subject.order).to eq([
            {"Chips" => 1.0},
            {"Chips" => 1.0},
            {"Burger" => 1.50},
            {"Burger" => 1.50}
        ])
    end

    it 'can get the sum of items in the order array' do
        subject.order_item("Chips")
        subject.order_item("Burger")
        expect(subject.order_sum).to eq(2.50)
    end
end