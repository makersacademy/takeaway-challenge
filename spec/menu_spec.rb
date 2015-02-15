require 'menu'

describe Menu do

  it 'should be able to add dishes' do
    menu = Menu.new
    sandwich = double :sandwich
    salad = double :salad
    menu.add_dish(sandwich)
    menu.add_dish(salad)
    expect(menu.dish_list). to eq [sandwich, salad]
  end

  it 'should be able to set price for dishes' do
    menu = Menu.new
    sandwich = double :sandwich
    salad = double :salad
    menu.add_dish(sandwich)
    menu.add_dish(salad)

    menu.set_price_of(sandwich, 5)
    menu.set_price_of(salad, 6)
    expect(menu.price_of(sandwich)).to eq 5
    expect(menu.price_of(salad)).to eq 6
  end 

end