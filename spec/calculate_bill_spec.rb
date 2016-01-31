require 'calculate_bill'
require 'order'

describe CalculateBill do
  subject(:calc){described_class.new}

  describe '#final_total' do

   it 'returns correct amount' do
    expect(calc.final_total([{"Margherita"=>2}])).to eq(23.98)
   end
  end
  
  describe '#itemised_bill'do

   it 'returns itemised bill' do
    all_order = [{"Margherita"=>2}]
    expect(calc.itemised_bill(all_order)).to eq(["2.0 X Margherita(11.99) = 23.98"])
   end
  end
end