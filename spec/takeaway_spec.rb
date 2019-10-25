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
end