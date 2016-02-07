require 'calculate_bill'


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
    message1 = "2.0 X Margherita(11.99) = 23.98"
    expect(calc.itemised_bill(all_order)).to eq([message1])
   end
  end
end