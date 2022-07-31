require_relative '../lib/menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { double :dishes}
  let(:dishes) do {
      calzone: 5,
      pizza: 8,
      mozzarella: 3,
      pasta: 6,
      gelato: 4
    }
  end
  
  describe '#initialize' do
    it 'has a list of dishes with its prices' do
      expect(menu.dishes).to eq(dishes)
    end
  end

  describe '#view_menu' do
    it 'prints the menu viewed' do
      viewed_menu = "Calzone: £5, Pizza: £8, Mozzarella: £3, Pasta: £6, Gelato: £4"
      expect(menu.view_menu).to eq(viewed_menu)
    end
  end

  it 'calculates basket item prices' do
    expect(menu.price("pizza")).to eq(dishes["pizza"])
  end

end