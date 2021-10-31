require 'menu'

describe Menu do
  it 'prints see menu' do
    menu = Menu.new
    expect(menu.see_menu).to eq [
      { name: "Cod", price: 6 },
      { name: "Haddock", price: 6 }, 
      { name: "Plaice", price: 6 }, 
      { name: "Chips", price: 2 },
      { name: "Sausage", price: 3 }
    ]
  end
end
