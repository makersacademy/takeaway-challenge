require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      Chicken: 3.99,
      falafel: 4.50
    }
  end

  it 'has a list of sishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end



end
