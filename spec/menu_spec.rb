require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) do {
    Fish: 2365,
    Chips: 1836,
    Kebab: 4317
  }
end

  it 'has a menu with prices' do
    expect(menu.list).to eq ["Fish: £2365", "Chips: £1836", "Kebab: £4317"]
  end

  it 'checks if a dish is on the menu' do
    expect(menu.on_menu?('Fish')).to be true
  end

  it 'checks if a dish is not on the menu' do
    expect(menu.on_menu?('Chicken')).to be false
  end

  it 'checks a dishes price' do
    expect(menu.price(:chips)).to eq(dishes[:chips])
  end
  
end
