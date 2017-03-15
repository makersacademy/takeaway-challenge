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

it 'tells if a dish in on the menu' do
  expect(menu.has_dish?(:edamame)).to be true
end

it 'tells if a dish in not on the menu' do
  expect(menu.has_dish?(:tuna)).to be false
end

it 'calculates the price' do
  expect(menu.price(:edamame)).to eq(dishes[:edamame])
end

end
