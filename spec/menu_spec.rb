require 'menu'

describe Menu do
  
let(:menu) { Menu.new }

  it 'creates an array of dishes' do
    expect(menu.contents).to eq []
  end

  it 'can add dishes' do
    dish = double dish, name: "Fish and Chips", price: "£5.00"
    menu.add(dish)
    expect(menu.contents).to eq [{dish: dish, name: "Fish and Chips", price: "£5.00"}]
  end

  it 'lists menu items' do
    dish1 = double :dish, name: "Fish and Chips", price: "£5.00"
    dish2 = double :dish, name: "Hotdog", price: "£2.50"
    menu.add(dish1)
    menu.add(dish2)
    expect(menu.display).to eq "1. Fish and Chips @ £5.00 \n2. Hotdog @ £2.50 \n"
  end
end