require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      duck: 5.99,
      prawn: 4.99

      }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes and prices' do
    printed_menu = "Duck £5.99, Prawn £4.99"
    expect(menu.print_items).to eq(printed_menu)
  end

end
