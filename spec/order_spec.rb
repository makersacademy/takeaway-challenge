require './lib/order'

describe Order do

  choripan = Dish.new(:choripan, 5.95)
  milanesa = Dish.new(:milanesa, 7.95)
  menu1 = Menu.new(choripan, milanesa)
  order = Order.new(menu1)
  order2 = Order.new(menu1)

  describe '#initialize' do
    it "loads the menu class" do
      expect(order.menu).to eq menu1
    end
  end

  describe '#add_item' do
    before do
      order.add_item(choripan)
    end
    it "defaults the qty value to 1 if no value given" do
      expect(order.order[choripan].to_i).to eq 1
    end
    it "adds the dish item and qty to order hash" do
      expect(order.order).to include choripan
    end
    it "adds total qty ordered if item previously ordered" do
      order.add_item(milanesa)
      order.add_item(milanesa, 2)
      expect(order.order[milanesa].to_i).to eq 3
    end
  end

  describe '#total_price' do
    it "returns the total value of the order" do
      order2.add_item(milanesa, 2)
      order2.add_item(choripan, 2)
      expect(order2.total_price).to eq 27.8
    end
  end


end
