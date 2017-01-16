require 'order'

describe Order do
    
    subject(:order) {described_class.new}
    
    it 'can\'t add dishes that aren\'t on the menu' do
        wrong_order = "Lamb Rogan Josh 1, Big Mac 3"
        error = "Big Mac is not on the menu"
        expect{order.add(wrong_order)}.to raise_error error
    end
    
    context 'has been passed an order' do
        
        before do
            user_order = "Lamb Rogan Josh 1, Chicken Madras 2"
            order.add(user_order)
        end
    
        it 'takes an order and converts it to a hash' do
            order_hash = { lamb_rogan_josh: 1, chicken_madras: 2 }
            expect(order.current_order).to eq(order_hash)
        end
        
        it 'can return the total of the current order' do
            order_total = "Your order total is: £27.15"
            expect(order.total).to eq(order_total)
        end
    end
end

# Edge cases
#
#Over writing orders?
#increasing quantity?
#misspelt orders?