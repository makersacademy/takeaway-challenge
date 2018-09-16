require './lib/menu'

describe Menu do

  it 'should store a menu' do
    expect(subject.menu).to eq [
    { dish: "Egg Fried Rice", price: 2 },
    { dish: "White Rice", price: 2 },
    { dish: "Can of Coke", price: 1},
    { dish: "Bottle of Water", price: 1 },
    { dish: "Duck in Black Bean Sauce", price: 5 },
    { dish: "Quarter Aromatic Crispy Duck", price: 8 },
    { dish: "Half Aromatic Crispy Duck", price: 15 },
    { dish: "Full Aromatic Crispy Duck", price: 29 }
  ]
  end

end
