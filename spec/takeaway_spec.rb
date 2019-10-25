require 'takeaway'

describe Takeaway do 
    it 'should be a type of takeaway' do 
        expect(subject).to be_an_instance_of(Takeaway)
    end 

    it 'should have a menu' do 
        expect(subject.menu.first).to eq({ "item" => "Cod", "price" => 5.00, "quantity" => 20}) 
    end
end