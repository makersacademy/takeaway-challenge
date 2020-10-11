require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      Pizza: '3',
      Soup: '4'
    }
  end

  it 'subject has dishes and price' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints prices and dishes' do
    printed_menu = "Pizza $3, Soup: $4"
    expect(menu.print_method).to eq(dishes)
  end
end
