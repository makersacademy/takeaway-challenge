require "menu"

describe Menu do
  let(:dishes) do
    {
      Pizza: 5.99,
      Felafel: 3.50
    }
  it 'has list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end


end

