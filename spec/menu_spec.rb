require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      Chicken: 3.99,
      falafel: 4.50
    }
  end

  it 'has a list of sishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  describe '#print' do
    it 'prints a list of dishes and prices' do
      printed_menu = 'Chicken £3.99, Falafel £4.50'
      expect(menu.print).to eq(printed_menu)
    end
  end



end
