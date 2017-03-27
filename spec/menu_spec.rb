require 'menu'

describe Menu do

  subject(:menu){described_class.new(dishes)}
  let(:dishes) do {rolls: 3, curry: 5} end

  it 'has a list of dishes' do
    expect(menu.dishes).to eq dishes
  end

  describe "#print" do

    it 'prints out the menu' do
      printed_menu = "Rolls £3.00, Curry £5.00"
      expect(menu.print).to eq printed_menu
    end
  end

  describe "#price" do
    it 'returns the price of the dish' do
      expect(menu.price(:rolls)).to eq 3
    end
  end
end
