require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      "chicken": 6.99,
      "coke": 1,
      "toast": 2.5
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of items and prices' do
    printed_menu = "Chicken - £6.99, Coke - £1.00, Toast - £2.50"
    expect(menu.print).to eq printed_menu
  end

end
