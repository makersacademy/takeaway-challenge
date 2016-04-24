require 'menu.rb'
describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      Margherita: 6.00,
      Pepperoni: 6.50,
    }
  end

   it 'has some dishes stored' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints dishes and prices' do
    print_dish = "Margherita: £6.00, Pepperoni: £6.50"
    expect(menu.print).to eq(print_dish)
  end



end
