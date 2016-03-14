require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#initialize' do
    it '0.0 initializes with a list of menu' do
      expect(menu.list).to include('sushi: £7')
    end
  end

  describe '#find_price' do
    it '1.0 finds a price of a given dish from the menu' do
      expect(menu.find_price('sushi')).to eq(7)
    end
    it '1.1 raises an error if the given dish is not listed' do
      message = 'This dish is not available'
      expect{menu.find_price('banana')}.to raise_error message
    end
  end
end
