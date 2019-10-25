require 'takeaway'

describe Takeaway do 
    let(:new_customer) { double :customer, name: "Rob", number: "07713836331" }


    it 'should be a type of takeaway' do 
        expect(subject).to be_an_instance_of(Takeaway)
    end 

    it 'should have a menu' do 
        expect(subject.menu.first).to eq({ "item" => "Cod", "price" => 5.00, "quantity" => 20}) 
    end

    it 'should create a new order' do 
        subject.new_order(new_customer)

        expect(subject.customers.first).to eq new_customer
    end
end