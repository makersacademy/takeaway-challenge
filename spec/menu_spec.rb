require "menu"

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      Pizza: 5.99,
      Felafel: 3.50
    }
  end
  it 'has list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end
end

