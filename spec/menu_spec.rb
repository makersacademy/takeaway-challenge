require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe '#display_dishes' do
    it 'displays a list of dishes with prices' do
      expect(menu.display_dishes).to include menu.dishes
    end
  end
end
