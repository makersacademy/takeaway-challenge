require 'menu'

describe Menu do 
  let(:menu) { Menu.new }
  it 'initializes with a list of dishes and prices' do 
    expect(menu.items).to include({ item: "Margherita", price: 10 })
  end 
  
  it 'displays the list of dishes' do
    expect { menu.display }.to output("Margherita £10\nHawaiin £12\n").to_stdout
  end 

  it 'returns a specific dish and quantity' do 
    expect(menu.select("Margherita", 2)).to eq({ item: "Margherita", price: 10, quantity: 2 })
  end 
end
