require 'takeaway'

describe Takeaway do 
    let(:new_customer) { double :customer, name: "Rob", number: "07713836331" }
    let(:order_item) { double :item, name: "Cod", price: 5.0}
    let(:other_item) { double :item, name: "Haddock", price: 6.0}

    it 'should be a type of takeaway' do 
        expect(subject).to be_an_instance_of(Takeaway)
    end 

    it 'should have a menu' do 
        expect(subject.menu.first).to eq({ "item" => "Cod", "price" => 5.00, "quantity" => 20}) 
    end

    it 'should have order complete set to false' do 
        expect(subject.order_complete).to eq false
    end

    it 'should have empty orders array' do 
        expect(subject.orders).to eq []
    end 

    it 'should be able to see menu' do 
        expect(subject.show_menu).to eq("Cod: £5.0, Haddock: £6.0, Chips: £2.5, Jumbo Sausage: £3.0, Curry Sauce: £1.0, Mushy Peas: £1.0")
    end

    it 'should be able to add customer details to the order' do
        subject.add_customer_details(new_customer)

        expect(subject.get_customer_details).to eq new_customer
    end

    it 'should get the current order details' do 
        subject.add_item(other_item, 3)
        subject.add_item(order_item, 1)
        expect(subject.get_order_details).to eq "Order: 3 Haddock, 1 Cod"
    end 

    it 'should get the total order price' do 
        subject.add_item(order_item, 5)
        expect(subject.get_order_price).to eq 25
    end 

    it 'should turn order_complete to true when completed order' do 
        subject.complete_order
        expect(subject.order_complete).to eq true
    end

    it 'should add the order to the orders array' do 
        subject.add_item(order_item, 5)
        subject.complete_order
        expect(subject.orders.length).to eq 1
    end
end