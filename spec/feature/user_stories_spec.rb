require 'menu'
require 'dish'

describe "User stories" do
  let(:menu) { Menu.new }
  dish_name = "char sui bun"
  number = 1
  price = 3.99
  let(:dish) { Dish.new(dish_name, price)}

  describe "Order" do

    it "selects some number of several available dishes" do
      selected_dishes= menu.select(dish,number)
      expect(selected_dishes).to include({dish=>number})
    end

  end

end
