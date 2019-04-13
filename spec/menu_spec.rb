require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes)}
  let(:dishes) { double :dishes }

  let(:dishes) do
    { pizza: 10,
      chips: 5,
      burger: 8,
      curry: 5,
      tofu: 6
    }
  end

  it 'has a list of dishes and prices' do
  expect(menu.dishes).to eq(dishes)
  end

  it 'prints menu' do
    viewed_menu = "Pizza, 10, Chips, 5, Burger, 8, Curry, 5, Tofu, 6"
    expect(menu.view_menu).to eq(viewed_menu)
    end
  end
