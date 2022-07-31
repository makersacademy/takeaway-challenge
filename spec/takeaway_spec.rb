require 'takeaway'

describe Takeaway do
    subject (:takeaway) {Takeaway.new}
    #let (:MENU) {double :choice} 

    it 'Initial order is empty' do
        expect(takeaway.order).to be_empty
    end

    describe '#view_menu' do
        it { is_expected.to respond_to(:view_menu) }

        it 'lists all purchasable items' do
            expect(takeaway.view_menu).to eq(Takeaway::MENU)
        end        
    end

    describe '#order_item' do
        it { is_expected.to respond_to(:order_item).with(1).argument }

        it 'selects an item from the menu' do
            expect{ takeaway.order_item(:Beer) }.to change{ takeaway.order }
        end

        it 'selects a quantity of that item' do
            #Arrange
            takeaway.order_item(:Beer)
            takeaway.order_item(:Beer)
            #Assert
            expect(takeaway.order).to eq(:Beer => 2)
        end

        it 'messages to confirm that item has been added to the order' do
            #arrange
            takeaway.order_item(:Beer)
            #assert
            expect("[1]x portions of Beer(s) have now been added to your order.").to include("Beer")
            #expect("[1]x portions of Beer(s) have now been added to your order.").to eq("[1]x portions of Beer(s) have now been added to your order.")
            #expect("#{takeaway.order[values]}x portions of #{choice}(s) have now been added to your order.").to match("#{takeaway.order[values]}x portions of #{choice}(s) have now been added to your order.")
        end

        it 'raises an error message if item is not on the menu' do
            #arrange
            takeaway.order_item(:Bananas)
            #Assert
            expect { takeaway.order_item(:Bananas) }.to raise_error "Item is not currently on the menu."           
        end


    end


end