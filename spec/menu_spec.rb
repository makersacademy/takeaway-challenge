require 'menu'
describe Menu do
subject(:menu){ described_class.new(dishes) }
  let(:dishes) { {chicken: 1.20, donner: 1.99, chicken_tikka: 2.99 } }


    it 'validates the dish name with price' do
      expect(menu.dishes).to eq(dishes)
    end

    it 'calculates the price of the dishes' do
      expect(menu.calculate_price(:donner)).to eq(dishes[:donner])
    end

    it 'display the list of dishes' do
      expect(menu.display_menu).to eq dishes
    end
    it 'validates the dish is on the menu' do
      # dish = {dish: 'chees_burger'}
      expect(menu.dish_available?(:donner)).to be true
    end
    it 'validates if dish is not on the menu' do
      expect(menu.dish_available?(:tomato)).not_to be true
    end

end # => menu describe
