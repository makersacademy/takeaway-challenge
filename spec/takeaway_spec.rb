require 'takeaway'

describe Takeaway do
    
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    # ? - Create a Menu class Done 
    # ? - List of dishes with prices
    # ? - Print dishes with prices one per line from takeaway
    let(:dishes) {[
        {dish1: 'Lasagne', price: 4.99},
        {dish2: 'Chicken', price: 5.99},
        {dish3: 'Steak', price: 8.99},
        {dish4: 'Burger', price: 7.99},
        {dish5: 'Borritto', price: 7.99},
        {dish6: 'Omelette', price: 4.99}
    ]}

    describe '#print_dishes' do
        let(:menu) { double("menu double", :display => dishes) }
        it 'prints out the menu' do
            expect(subject.print_dishes).to eq(dishes)
        end
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    describe '#selection' do
        it 'lets the user select items' do
            subject.selection(1)
            expect(subject.order).to eq([{dish: 'Lasagne', price: 4.99}])
        end
    end

end