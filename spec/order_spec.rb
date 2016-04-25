require 'order'
require 'dish'
require 'pry'

describe Order do     #less let

  subject(:order) { described_class.new(menu) }
  let(:takeaway) { Takeaway.new(menu: menu, order: order, sms: sms, config: :config) }
  let(:menu) { double :menu, dishes: [dish, dish2] }
  let(:dish) { Dish.new(name: "Pizza", price: 7.50) }
  let(:dish2) { Dish.new(name: "Soup", price: 3.20) }
  let(:dish1) { double :dish }
  let(:sms) { instance_double "SMS", deliver: nil }
  
  context "when order is placed" do

    it 'shows the order total' do
      takeaway.place_order(dish, 2)
      takeaway.place_order(dish2, 1)
      expect(order.total).to eq 18.20
    end
  end
end