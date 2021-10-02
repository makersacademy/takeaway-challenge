require 'takeaway' 

describe TakeAway do 
    it 'responds to select method' do 
        expect(subject).to respond_to(:select)
    end

    it 'checks that select method takes two arguments' do
        expect(subject).to respond_to(:select).with(2).arguments
    end


end