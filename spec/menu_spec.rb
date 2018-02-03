require "menu"

describe Menu do

  subject(:menu) { described_class.new }

  it 'contains a list of dishes' do
    expect(menu.dishes).to eq({
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     })
  end
end
