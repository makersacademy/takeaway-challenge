require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) {{
    Pizza: 10.50,
    Pasta: 8.50, 
    Risotto: 7.00
  }}

  it 'has a menu with dishes' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'shows a menu with dishes' do 
    printed_menu = "Pizza: £10.50, Pasta: £8.50, Risotto: £7.00"
    expect(menu.print).to eq(printed_menu)
  end
end

