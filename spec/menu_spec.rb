require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {beef: 3.00, sausage: 2.50}
  end

  it 'has a list of dishes with prices' do
  expect(menu.dishes).to eq (dishes)
  end
end
