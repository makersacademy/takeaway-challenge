require 'menu'

describe Menu do 
    it 'responds to select method' do 
        expect(subject).to respond_to(:select)
    end
        
    it 'responds to item_choice method' do
        expect(subject).to respond_to(:item_choice)
    end

    it 'checks that select method returns a random item from DISHLIST' do 
        expect(subject.select).to eq(:burger).or eq(:pizza).or eq(:chips)
    end

end