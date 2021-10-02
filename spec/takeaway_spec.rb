require 'takeaway' 

describe TakeAway do 


    # it 'checks that select method takes one argument' do
    #     expect(subject).to respond_to(:select).with(1).arguments
    # end

    it 'responds to see_dishes method' do
        expect(subject).to respond_to(:see_dishes)
    end

    it 'returns list of dishes when see_dishes is called' do
        expect(subject.see_dishes).to eq(TakeAway::DISHLIST)
    end

    # it 'checks that an item can be chosen in tests' do 
    #     t = TakeAway.new(:ramen)
    #     expect(t).to eq(:ramen)
    # end
    
end