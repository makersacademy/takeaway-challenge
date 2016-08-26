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

   context '#dish_quantity' do
     it 'returns the correct number of dishes left for a given dish' do
       expect(subject.dish_quantity("Bangers & Mash")).to eq(9)
     end

     it 'returns the correct number of dishes left for a given dish' do
       expect(subject.dish_quantity("Chicken Tika")).to eq(8)
     end
   end

   context '#dish_available' do
     it 'returns true if the dish is still available' do
       expect(subject.dish_available?("Bangers & Mash")).to be true
     end

     it 'returns false if the dish is not available' do
       expect(subject.dish_available?("Dish 5")).to be false
     end
   end
end
