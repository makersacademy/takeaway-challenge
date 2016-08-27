require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe '#display_dishes' do
    it 'displays a list of dishes with prices' do
      expect(menu.display_dishes).to include menu.dishes
    end
  end

  describe '#select_dishes' do
    it 'selects dishes from the list' do
    menu.display_dishes
      expect(menu).to respond_to(:select_dishes).with(1).argument
    end
  end
end
