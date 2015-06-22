require 'menu'
describe Menu do 
  let (:hilib){double :dish, name: 'hilib', price: 10}
  let (:pasta){double :dish, name: "pasta", price: 6}
  let (:baris){double :dish, name:"baris", price: 7}
  let (:menu){Menu.new [pasta, baris]}
  it 'has meals' do 
    expect(menu.meals).to eq [pasta,baris]
  end
  it 'can add meals to the menu' do 
    expect(menu.meals).to eq [pasta, baris]
    menu.add hilib
    expect(menu.meals).to eq [pasta,baris,hilib]
  end
end