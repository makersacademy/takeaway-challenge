require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe '#display_dishes' do
    it 'displays a list of dishes with prices' do
      expect(menu.display_dishes).to include({"chicken" => 5})
    end

    it 'checkes the price of the dish' do
        expect(menu.price_check("chips")).to eq 2
    end

  end
end
