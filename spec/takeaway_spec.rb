require 'takeaway' 


describe Takeaway do 
    describe '#dish' do 
        it 'lists the dishes with prices' do 
            takeaway = Takeaway.new
            expect(takeaway.dish).to include("topokki" => 10, "rice" => 5, "Kimchi" => 5,  "Bibimbap" => 15)
        end 
    end 
end  