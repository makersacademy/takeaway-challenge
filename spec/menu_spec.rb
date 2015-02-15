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

end