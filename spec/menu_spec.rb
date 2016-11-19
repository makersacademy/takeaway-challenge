require 'menu'

describe Menu do
subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      hawaiian: 9.99,
      margherita: 7.99

    }
end
  it 'should show a list of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'should print a list of dishes and prices' do
    printed_menu = "Hawaiian £9.99, Margherita £7.99"
    expect(menu.print_menu).to eq(printed_menu)
  end
end
