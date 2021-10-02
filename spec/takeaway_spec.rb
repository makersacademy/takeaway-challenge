require 'takeaway'

describe TakeAway do 

    del = TakeAway.new
    it 'responds to see_dishes method' do
        expect(subject).to respond_to(:see_dishes)
    end

    it 'returns list of dishes when see_dishes is called' do
        expect(subject.see_dishes).to eq(TakeAway::DISHLIST)
    end
    
    it 'returns specified item from menu' do 
        del = TakeAway.new(:haggis)
        expect(del.print_item).to eq(:haggis)
    end

    it 'returns random item from menu' do 
        expect(subject.print_item).to eq(:burger).or eq(:pizza).or eq(:chips)
    end

    it 'checks select method takes two arguments' do 
        expect(del).to respond_to(:select).with(2).arguments
    end

    it 'adds some number(quantity) of an item to order and returns total order' do 
        del.select(:haggis, 3)
        expect(del.total_order).to eq([:haggis, :haggis, :haggis])
    end


end