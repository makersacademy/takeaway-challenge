require 'menu'

describe Menu do
  it 'has a menu' do
    expect(subject.respond_to?(:dishes)).to be true
  end
   it 'displays dishes and prices' do
    expect(subject.dishes).to eq [
      { name: 'Burger', price: 10.95 },
      { name: 'Pizza', price: 14.00 },
      { name: 'Salad', price: 7.60 },
      { name: 'fries', price: 2.90 }
    ]
  end
end
