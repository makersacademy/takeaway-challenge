require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do 
    {
      congee: 5.00,
      wonton: 10.00
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints the list of dishes with prices' do
    printed_menu = "Congee £5.00, Wonton £10.00"
    expect(menu.print).to eq(printed_menu)
  end

  it 'tells if a dish is on the menu' do
    expect(menu.has_dish?(:congee)).to be true
  end

  it 'tells if a dish is NOT on the menu' do
    expect(menu.has_dish?(:pizza)).to be false
  end

  it 'calculates the price of a dish' do
    expect(menu.price(:congee)).to eq(dishes[:congee])
  end
end
