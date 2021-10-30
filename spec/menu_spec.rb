require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  
  describe '#initialize' do
    it 'has a list of dishes with its prices' do
      expect(menu.dishes).not_to be_empty
    end
  end

  describe '#view_menu' do
    it 'prints the menu viewed' do
      viewed_menu = "Calzone: £5, Pizza: £8, Mozzarella sticks: £3, Pasta: £6, Gelato: £4"
      expect(menu.view_menu).to eq(viewed_menu)
    end
  end

end