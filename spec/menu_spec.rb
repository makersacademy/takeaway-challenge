require 'menu'

describe Menu  do
  
  subject(:menu) { described_class.new }

  context 'initialiazation' do
    it 'contains a list of dishes and prices' do
      expect(menu.dishes).to eq Menu::DEFAULT_MENU 
    end
  end

  context '#report_menu' do
    it{ is_expected.to respond_to :report_menu }

    it 'should return the list of dishes and prices on separate lines' do
      expect(STDOUT).to receive(:puts).exactly(menu.dishes.length).times
      menu.report_menu
    end

    # Test to see what dishes and prices are returned?
  end

  context '#report_price' do
    it 'should report the price of a menu item' do
      expect(menu.report_price('Coffee')).to eq 2.50
    end
  end

end