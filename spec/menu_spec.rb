require 'menu'

describe Menu do

  #list = Menu::LIST

  subject(:menu) { described_class.new }
  let(:dish1) { 'sushi' }

  describe '#initialize' do
    it '0.0 initializes with a list of menu' do
      expect(menu.list).to include('sushi: £7' && 'tonkotsu ramen: £12')
    end
  end

  describe '#find_price' do
    it '1.0 finds a price of a given dish from the menu' do
      expect(menu.find_price(dish1)).to eq(7)
    end
  end
end
