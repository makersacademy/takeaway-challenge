require 'menu'

describe Menu do
  let(:menu) { Menu.new }

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

  it 'can add dishes to it' do
    menu.add_dish("Icecream", 4.80)
  end

  # it 'can add dishes to it' do
  #   menu.add_dish("Icecream", 4.80)
  #   expect(subject.dishes).to eq 
  #     { name: 'Burger', price: 10.95 },
  #     { name: 'Pizza', price: 14.00 },
  #     { name: 'Salad', price: 7.60 },
  #     { name: 'fries', price: 2.90 },
  #     { name: 'Icecream', price: 4.80 }
  # end
end
