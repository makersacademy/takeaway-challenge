require './lib/order'

describe Order do

  choripan = Dish.new(:choripan, 5.95)
  milanesa = Dish.new(:milanesa, 7.95)
  menu1 = Menu.new(choripan, milanesa)
  order = Order.new(menu1)



  describe '#initialize' do
    it "loads the menu class" do
      expect(order.menu).to eq menu1
    end
  end

  describe '#add_dish' do
    it "adds the dish and qty to order hash" do
      order.add_dish(choripan, 2)
      expect(order.order).to include choripan
    end
  end


end
