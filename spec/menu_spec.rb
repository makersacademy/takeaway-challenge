require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
       burger: 9.50,
       falafel: 6.50
    }
  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq (dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Burger: £9.50, Falafel £6.50"
    expect(menu.print).to eq(printed_menu)
  end
end
end
