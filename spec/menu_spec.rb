require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  it 'has a list of dishes' do
    expect(menu.dishes).to be_an_instance_of(Hash)
  end

  describe '#print_menu' do
    it 'returns a formatted list of dishes' do
      expect(menu.print_menu)
        .to eq(["Large Fish Supper - 7.90", "Small Fish Supper - 5.50",
          "White Sausage - 2.30", "Mars Bar in Batter - 2.00"])
    end
  end

  describe 'on_menu?(dish)' do
    it 'returns price if the dish is on the menu' do
      expect(menu.not_on_menu?("Large Fish Supper")).to eq false
    end
  end

  describe '#get_price_for(dish)' do
    it 'returns the price of the dish' do
      expect(menu.get_price_for("Large Fish Supper")).to eq 7.90
    end
  end
end
