require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { double :dishes }
  let(:dishes) do {
      pizza: 10,
      chips: 5,
      burger: 6,
      falafel: 4,
      halloumi: 5
    }
  end

  it 'has a list of dishes and prices' do
  expect(menu.dishes).to eq(dishes)
  end

  it 'prints menu' do
    viewed_menu = "Pizza: £10, Chips: £5, Burger: £6, Falafel: £4, Halloumi: £5"
    expect(menu.view_menu).to eq(viewed_menu)
    end

    it 'calculates prices' do
    expect(menu.price(:pizza)).to eq(dishes[:pizza])
end
end
