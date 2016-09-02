require 'price_calc'

describe PriceCalculator do

subject{described_class.new([['ham', 5]],17.5)}

   it 'calculates the price of the order correctly' do
     expect(subject.calculate).to eq 17.5
   end

   it 'gives receipts upon request' do
     expect(subject.receipt).to include subject.calculate.to_s
   end

   it 'accurately compares expected price with actual' do
     expect(subject.price_expectations_checker).to eq 0
   end

end
