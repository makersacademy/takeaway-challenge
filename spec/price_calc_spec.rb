require 'price_calc'

describe PriceCalculator do

subject{described_class.new([{food: 'ham', quantity: 5}])}

   it 'calculates the price of the order correctly' do
     expect(subject.calculate).to eq 17.5
   end

   it 'gives receipts upon request' do
     expect(subject.receipt).to include subject.calculate.to_s
   end

end
