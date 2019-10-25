require 'takeaway'

describe Takeaway do
    it 'creates and instance of the takeaway class' do
        expect(subject).to be_an_instance_of(Takeaway)
    end

    it 'returns the list of items on the menu' do
        expect(subject.show_menu).to include("Chips" => 1.00)
    end
end