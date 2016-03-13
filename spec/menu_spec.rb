require 'menu'

describe Menu do

  #list = Menu::LIST

  subject(:menu) { described_class.new }

  describe '#initialize' do
    it '0.0 initializes with a list of menu' do
      expect(menu.list).to include('Sushi: £7' && 'Ramen: £12')
    end
  end
end
