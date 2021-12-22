require 'menu'

describe Menu do
  it 'initialize with a list of dishes' do
  menu = Menu.new
  expect(menu.print_dishes).to be_a(Hash)
  #   list_of_dishes = [ {dish: 'rice', price: 4}, {dish: 'noodles', price: 3}, {dish: 'chicken', price: 2} ]

  #   expect(menu.dishes).to eq list_of_ishes
  end
end