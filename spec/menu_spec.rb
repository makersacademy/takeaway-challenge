require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      "fried chicken": "6.99",
      "coke": "1.00",
      "toast": "2.00"
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of items and prices' do
    printed_menu = "Fried chicken £6.99, Coke £1.00, Toast £2.00"
    expect(menu.print).to eq printed_menu
  end

end
