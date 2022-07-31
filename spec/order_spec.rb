require 'order'
require 'menu'

describe Order do

    let(:order) { Order.new(menu) }
    let(:menu) { instance_double("Menu") }
    let(:food) {double :food}
    let(:quantity) {double :quantity}
    let(:dish){ {food: food, quantity: quantity} }

    let(:dishes) do
        {
          lasagna: 2,
          salad: 1
        }
    end

    it "selects several dishes from the menu" do
        order.add_dish(food, quantity)
        expect(order.dishes).to include dish
    end

end