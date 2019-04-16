require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { double :dishes }
  let(:dishes) do {
    "pizza" => 10,
    "chips" => 5,
    "burger" => 6,
    "falafel" => 4,
   "halloumi" => 5
 }
  end

  describe '#initialize' do
    it 'has a list of dishes and prices' do
      expect(menu.dishes).to eq(dishes)
    end
  end

  describe '#view_menu' do
    it 'prints menu' do
      viewed_menu = "Pizza: £10, Chips: £5, Burger: £6, Falafel: £4, Halloumi: £5"
      expect(menu.view_menu).to eq(viewed_menu)
    end
  end
end
