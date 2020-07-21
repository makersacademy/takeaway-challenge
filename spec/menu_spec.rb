require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      chicken: 15.00,
      steak: 18.00,
      donner: 8.00,
    }
  end

  it 'contains a list of the dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end
  it 'prints a list of the dishes with prices' do
    printed_menu = "Chicken £15.00, Steak £18.00, Donner £8.00"
    expect(menu.print).to eq(printed_menu)
  end
end
