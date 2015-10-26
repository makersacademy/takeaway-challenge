require 'menu'

describe Menu do
  let(:menu){described_class.new}
  it 'lists dishes that are in the menu' do
    expect(menu.dishes).to eq([{ name: "Hamburger", price: 1},
        {name: "Pizza", price: 2},
        {name: "Hotdog", price: 2},
        {name: "Tacos", price: 3},
        {name: "Nachos", price: 1}])
  end
end
