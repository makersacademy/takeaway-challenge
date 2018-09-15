require 'menu'

describe Menu do
  let(:menu)          { described_class.new }
  let(:dishes) do {
    "doughnut" => 1.99,
    "cake" => 2.50,
    "pancakes" => 3.00,
    "ice-cream" => 1.99
  }
  end

  describe 'menu contents' do
    it 'contains a list of dishes with prices' do
      expect(menu.dishes).to eq dishes
    end

    # it 'displays a formatted list of an item and its price' do
    #   expect(menu.format_menu).to eq pretty_dishes
    # end
  end
end
