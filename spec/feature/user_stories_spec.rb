require 'menu'
require 'dish'
require 'basket'
require 'basket_item'

describe "User stories" do
  let(:menu) { Menu.new }
  let(:basket) { Basket.new(menu.dishes) }
  let(:pizza) {Dish.new("Pizza", 2)}
  let(:amok) {Dish.new("Amok", 4)}
  let(:salad) {salad = Dish.new("Salad",2)}

  describe "basket" do
    before do
      menu.add(pizza)
      menu.add(amok)
      menu.add(salad)
      basket.add(amok,2)
    end

    it "adds selected dishes" do
      basket_list = basket.add(salad,3)
      expect(basket_list).to include({amok=>2})
    end

    it "adds up the quantity of the same dish if added more" do
      basket_list = basket.add(amok,2)
      expect(basket_list).to include({amok=>4})
    end

    it "summarizes basket with sub total price" do
      basket_item_list = basket.summary
      p basket_item_list
      expect(basket_item_list.count).to eq 1
      expect(basket_item_list.first.name).to eq "Amok"
      expect(basket_item_list.first.quantity).to eq 2
      expect(basket_item_list.first.sub_total).to eq 8
    end

  end

end
