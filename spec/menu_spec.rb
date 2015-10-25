require 'menu'

describe Menu do

  it 'lists dishes that are in the menu' do
    expect(subject.dishes).to eq([{ name: "Hamburger", price: 1},
        {name: "Pizza", price: 2},
        {name: "Hotdog", price: 2},
        {name: "Tacos", price: 3},
        {name: "Nachos", price: 1}])
  end
end
