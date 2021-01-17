require 'menu'
describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
    Korma: 5.00,
    Naan: 3.50,
    Rice: 2.00
    }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  describe '#display' do

    it 'shows a list of dishes with their prices' do
      displayed_menu = "Korma: £5.00, \nNaan: £3.50, \nRice: £2.00"
      expect(menu.display).to eq(displayed_menu)
    end
  end
end
