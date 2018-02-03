require "menu"

describe Menu do

  subject(:menu) { described_class.new }
  subject(:order) do
    menu.new_order(:pizza)
    menu.new_order(:red_wine)
    menu
  end

  it 'contains a list of dishes' do
    expect(menu.dishes).to eq({
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     })
  end

  describe '#new_order' do
    it 'creates an order' do
      expect(menu.new_order(:pizza)).to eq [{ pizza: 10 }]
    end
  end
end
