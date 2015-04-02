require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:burger) { double :dish, name: 'Burger', price: 3 }
  let(:chips)  { double :dish, name: 'Chips',  price: 2 }

  it 'has no dishes when created' do
    expect(menu.dishes).to be_empty
  end

  it 'can add a dish' do
    menu.add burger
    expect(menu.dishes).to eq ['Burger']
  end

  it 'can be displayed' do
    menu.add burger
    menu.add chips
    menu_expect = "1. Burger: £3\n2. Chips: £2\n"
    expect(menu.view).to eq menu_expect
  end

  it 'can have dishes removed from it' do
    menu.add burger
    menu.remove burger
    expect(menu.dishes.include?('Burger')).to be false
  end
end
