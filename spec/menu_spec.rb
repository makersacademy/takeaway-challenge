require 'menu'

describe Menu do

it 'creates an instance of Menu' do
  menu = Menu.new
  expect(menu).to be_an_instance_of(Menu)
end

it 'lists all dishes on the menu' do
  menu = Menu.new
  expect(menu.dishes).to eq([
  {name: "Hummus", price: "3.70"},
  {name: "Olives", price: "2.10" },
  {name: "Taramasalata",  price: "3.70"},
  {name: "Aubergine", price: "3.80"},
  {name: "Kleftico"  , price: "13.50"},
  {name: "Stifado"  , price: "12.50"},
  {name: "Moussaka"  , price: "11.25"}
  ])
end

end
