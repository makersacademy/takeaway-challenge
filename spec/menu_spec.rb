require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:dishes) { {"doughnut" => 2, "cake" => 2, "pancakes" => 3, "ice-cream" => 2} }
  let(:pretty_dishes) { "Doughnut £2.00, Cake £2.00, Pancakes £3.00, Ice-cream £2.00" }


  describe 'menu contents' do
    it 'contains a list of dishes' do
      expect(menu.dishes).to eq dishes
    end

    it 'displays a pretty list of dishes with prices' do
      expect(menu.display_menu).to eq(pretty_dishes)
    end
  end
end
