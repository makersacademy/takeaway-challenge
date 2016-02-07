require 'menu'
describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      patties: 2.95,
      ackee: 6.95
    }
  end
  it 'contains an array of dishes with prices' do
    expect(menu.dishes).to eq(dishes)

  end

  it 'prints list of dishes with their prices' do
    printed_menu = 'Patties £2.95, Ackee £6.95'
    expect(menu.print).to eq (dishes)

  end
end
