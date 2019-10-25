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

    it 'returns an item from the menu and its price, depending on what the user enters' do
        expect(subject.order("Chips").to eq("Chips" => 1))
    end
end