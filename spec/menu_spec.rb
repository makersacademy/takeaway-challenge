require 'menu'

describe Menu do
  it 'returns a list of menu items' do
    expect(subject.dishes).to eq [
      { dish: 'Spare Ribs', price: 6.00 },
      { dish: 'Seaweed', price: 4.50 },
      { dish: 'Half Duck', price: 20.00 },
      { dish: 'Beef in Black Bean Sauce', price: 7.50 },
      { dish: 'Kung Po Chicken', price: 6.50 },
      { dish: 'Chicken Balls', price: 6.30 },
      { dish: 'Special Fried Rice', price: 5.60 },
      { dish: 'Beef Chow Mein', price: 6.00 },
      { dish: 'Chips', price: 2.00 }
    ]
  end
end
