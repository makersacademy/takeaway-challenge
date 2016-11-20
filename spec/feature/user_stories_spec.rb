require 'menu'
require 'dish'
require 'basket'

describe "User stories" do
  let(:menu) { Menu.new }
  let(:basket) { Basket.new(menu.dishes) }

  describe "basket" do

    it "adds selected dishes" do
      pizza = Dish.new("Pizza", 2)
      amok = Dish.new("Amok", 4)
      salad = Dish.new("Salad",2)
      menu.add(pizza)
      menu.add(amok)
      menu.add(salad)
      basket.add(pizza)
      basket.add(amok,2)
      basket_list = basket.add(salad,3)
      expect(basket_list).to include({amok=>2})
    end

  end

end
