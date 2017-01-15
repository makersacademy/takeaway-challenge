require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      Lamb: 4.50,
      Chicken: 3.50,
      Samosa: 2.00
    }
  end

  it 'Holds a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'Prints a list of dishes with prices' do
    printed_menu = "Lamb £4.50, Chicken £3.50, Samosa £2.00"
    expect(menu.print).to eq (printed_menu)
  end

end
