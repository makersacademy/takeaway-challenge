require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'has a list of dishes with its prices' do
      expect(menu.dishes).not_to be_empty
    end
  end

  describe '#view_menu' do
    it 'prints the menu' do
      view_menu = "calzone: £5"
      expect(menu.view_menu).to eq(view_menu)
    end
  end

end