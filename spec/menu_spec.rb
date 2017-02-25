require 'menu'

describe Menu do

 subject(:menu) { described_class.new(dishes) }
 let(:dishes) do
   {
    edamame: 2.45,
    vegetable_spring_roll: 4.80,
    salmon_roll: 3.80
   }
 end

 it 'has a list of dishes with prices' do
  expect(menu.dishes).to eq(dishes)
 end

 it 'prints a list of dishes with prices' do
   printed_menu = "Edamame £2.45, Vegetable_spring_roll £4.80, Salmon_roll £3.80"
   expect(menu.print).to eq(printed_menu)
end
end
