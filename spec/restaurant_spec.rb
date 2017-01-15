require 'restaurant'

describe Restaurant do

  choripan = Dish.new(:choripan, 5.95)
  milanesa = Dish.new(:milanesa, 7.95)
  menu1 = Menu.new(choripan, milanesa)
  order = Order.new(menu1)
  moo = Restaurant.new(order)

  let(:restaurant) { instance_double("restaurant") }


  describe '#initialize' do
    it "creates a new restaurant with an order parameter" do
      expect(moo.order).to eq order
    end
  end

  describe '#confirm_order' do
    it "does not send the message if order is not complete" do
      expect(moo.confirm_order).to eq nil
    end
  end

end
