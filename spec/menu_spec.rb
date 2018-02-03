require "menu"

describe Menu do

  subject(:menu) { described_class.new }
  subject(:order) do
    menu.order(:pizza)
    menu.order(:red_wine)
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

  describe '#order' do

    it 'creates an order' do
      expect(menu.order(:pizza)).to eq [{ pizza: 10 }]
    end
  end

  describe '#sum' do
    xit 'adds the total prices of the selected items' do
      expect(order.sum).to eq 14
    end
  end
end
