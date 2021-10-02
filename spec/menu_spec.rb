require 'menu'

describe Menu do 
    it 'responds to random_dish method' do 
        expect(subject).to respond_to(:random_dish)
    end

    it 'checks that select method returns a random item from DISHLIST' do 
        expect(subject.random_dish).to eq(:burger).or eq(:pizza).or eq(:chips)
    end

end