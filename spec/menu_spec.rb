require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes)}

  let(:dishes) do
    { pancakes: 4.00,
      waffles: 5.50,
      sandwich: 6.00
    }
    end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints the list of dishes with prices' do
    printed_menu = "Pancakes: £4.00, Waffles: £5.50, Sandwich: £6.00"
    expect(menu.print_menu).to eq(printed_menu)
  end

  it 'calculates price' do
    expect(menu.price(:pancakes)).to eq(dishes[:pancakes])
  end
end
