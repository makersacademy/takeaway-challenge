require "menu"
describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      Prawns: 3.50,
      Curry: 7.00
    }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes and their prices' do
    printed_menu = "Prawns £3.50, Curry £7.00"
    expect(menu.print).to eq(printed_menu)
  end
end
