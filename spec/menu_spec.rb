require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { double :dishes }
  let(:dishes) do {
    "tacos" => 5,
    "burrito" => 5,
    "quesadilla" => 7,
    "enchiladas" => 7
  }
  end

  describe '#initialize' do
    it 'has a list of dishes and prices' do
      expect(menu.dishes).to eq(dishes)
    end
  end

  describe '#print_menu' do
    it 'prints menu' do
      printed_menu = "Tacos: £5, Burrito: £5, Quesadilla: £7, Enchiladas: £7"
      expect(menu.print_menu).to eq(printed_menu)
    end
  end
end
