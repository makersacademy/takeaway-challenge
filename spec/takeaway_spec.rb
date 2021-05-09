require 'takeaway'

describe Takeaway do
    
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    let(:dishes) {[
        {dish: 'Lasagne', price: 4.99},
        {dish: 'Chicken', price: 5.99},
        {dish: 'Steak', price: 8.99},
        {dish: 'Burger', price: 7.99},
        {dish: 'Borritto', price: 7.99},
        {dish: 'Omelette', price: 4.99}
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
            subject.selection(3)
            subject.selection(4)
            subject.selection(6)
            expect(subject.orders).to eq([{dish: 'Steak', price: 8.99}, {dish: 'Burger', price: 7.99}, {dish: 'Omelette', price: 4.99}])
        end
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order
    describe '#total' do
        it 'will calculate and display the total items' do
            subject.selection(3)
            subject.selection(4)
            subject.selection(6)
            expect(subject.total).to eq(21.97)
        end
    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    # describe '#receipt' do
    #     it 'informs the customer of the delivery time'do
    #         subject.selection(3)
    #         subject.selection(4)
    #         subject.selection(6)
    #         subject.total
    #         subject.stub(:receipt).and_return('')
    #         expect(subject.orders).to eq([])
    #     end 
    #end
end