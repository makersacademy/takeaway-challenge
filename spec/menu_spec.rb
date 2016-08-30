require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

it 'contains a list of food and prices' do
  expect(menu.print_menu).to eq "Chicken: £3.50, Noodles: £3.50, Salad: £4.00, Cake: £2.50"
end

it 'can provide the price of a dish' do
  expect(menu.find_cost("Chicken")).to eq 3.50
end




end
