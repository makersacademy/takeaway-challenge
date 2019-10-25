require 'takeaway'

describe Takeaway do 
    let(:new_customer) { double :customer, name: "Rob", number: "07713836331" }


    it 'should be a type of takeaway' do 
        expect(subject).to be_an_instance_of(Takeaway)
    end 

    it 'should have a menu' do 
        expect(subject.menu.first).to eq({ "item" => "Cod", "price" => 5.00, "quantity" => 20}) 
    end

    it 'should be able to see menu' do 
        expect(subject.show_menu).to eq("Cod: £5.0, Haddock: £6.0, Chips: £2.5, Jumbo Sausage: £3.0, Curry Sauce: £1.0, Mushy Peas: £1.0")
    end

    it 'should be able to add customer details to the order' do
        subject.add_customer_details(new_customer)

        expect(subject.get_customer_details).to eq new_customer
    end
end