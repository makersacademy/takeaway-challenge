require 'menu.rb'

describe Menu do
   context '#dish_price' do
     it 'returns the correct price for a given dish' do
       expect(subject.dish_price("Bangers & Mash")).to eq(6.99)
     end

     it 'returns the correct price for a given dish' do
       expect(subject.dish_price("Chicken Tika")).to eq(7.99)
     end
   end

   context 'has_dish' do
     it 'returns false if the dish is not on the menu' do
       expect(subject.has_dish?("Cat")).to be false
     end

     it 'returns true if the dish is on the menu' do
       expect(subject.has_dish?("Pizza")).to be true
     end
   end
end
