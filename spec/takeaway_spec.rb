require 'takeaway'
require 'menu'

describe TakeAway do 
    del = TakeAway.new
    
    it 'responds to see_menu method' do
        expect(del).to respond_to(:see_menu)
    end

    it 'responds to select method' do 
        expect(del).to respond_to(:select)
    end

    it 'checks select method takes two arguments' do 
        expect(del).to respond_to(:select).with(2).arguments
    end

    it 'responds to order_summary method' do 
        expect(del).to respond_to(:order_summary) 
    end

    it 'adds some number(quantity) of an item to order and returns total order' do 
        del.select(:pizza, 3)
        expect(del.order_summary).to eq("Order Summary: pizza x3, burger x0, chips x0. Price Total: £12")
    end

    it 'throws error when selected item is not on menu' do 
        expect { del.select(:haggis, 1) }.to raise_error("Selected item not available. Please see menu.")
    end
end