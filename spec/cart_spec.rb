require 'cart'
require 'dish'
require 'viewer'
require 'menu'

meat_feast = Dish.new("Meat Feast", 950)
four_seasons = Dish.new("Four Seasons", 650)
veggie = Dish.new("Veggie", 700)
margherita = Dish.new("Margherita", 500)

cart = Cart.new

cart.receive_item(meat_feast)
cart.receive_item(four_seasons)
cart.receive_item(veggie)

describe Cart do
  describe '@order' do
    it 'can hold the order of the customer' do
      expect(cart.order).to eq [meat_feast, four_seasons, veggie]
    end
  end

  describe '#receive_item' do
    before(:each) do
      cart.receive_item(margherita)
    end
    it 'adds an item to the cart' do
      expect(cart.order).to eq [meat_feast, four_seasons, veggie, margherita]
    end
  end

  describe '#calculate_total' do
    it 'allows the user to view the total price' do
      expect(cart.calculate_total).to eq 2800
    end
  end
end
