require 'order'

describe Order do
    subject(:order) {described_class.new}
    
    
    describe '#initialize' do
        
        it 'should initialize with a blank hash of chosen items' do
            expect(order.chosen_items).to be_empty
        end
        
    end
    
    describe '#order_selection' do
        
        it 'should add items and quantities to the chosen items hash' do
            order_hash = {:Coke => 5}
            order.order_selection(:Coke, 5)
            expect(order.chosen_items).to eq order_hash
        end
        
        it 'should raise an error if item is not on the menu' do
            menu_error = 'please select an item from the menu'
            expect{order.order_selection(:Potato, 3)}.to raise_error menu_error
        end
    end
    
    describe '#check_order' do
        
        it 'should return a hash of the items added to order' do
            order_hash = {:Coke => 5}
            order.order_selection(:Coke, 5)
            expect(order.check_order).to eq order_hash
        end
    end
    
    describe '#show_menu' do
        
        it 'should show the menu of dishes' do
            expect(order.show_menu).to eq Menu::MENU_ITEMS
        end
    end
    
    describe '#show_bill' do
        
        it 'should show the total bill as a string' do
            order.order_selection(:Coke, 5)
            order.order_selection(:Prawn_Crackers, 3)
            order.order_selection(:Spring_Rolls, 5)
            expect(order.show_bill).to eq '£26.10'
        end
    end
    
    describe '#total dishes' do
        
        it 'should show the number of dishes that have been ordered' do
            order.order_selection(:Coke, 5)
            order.order_selection(:Prawn_Crackers, 4)
            order.order_selection(:Spring_Rolls, 3)
            expect(order.total_dishes).to eq 12
        end
    end
    
    describe '#confirmation_text' do 
        
        it 'should send a confirmation_text to the user' do
        end
    end
end