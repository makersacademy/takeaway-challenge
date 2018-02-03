require "menu"

describe Menu do
  subject(:menu) { described_class.new }

  it 'initializes with a list of food' do
    expect(menu.items).to eq({
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     })
  end
end
