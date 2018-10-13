require "order"

describe Order do

  let(:dish){double :dish, :publish_dish => "Spinach Juice", :category => "drink"}
  let(:pricemanager){double :pricemanager, :calculate_order_value => 10}
  subject(:order) {described_class.new}

  it "adds items to the order" do
    order.add_dish_to_order(dish,1)
    expect(order.orderlist.length).to eq 1
  end

  it "increments quantities to the order" do
    order.add_dish_to_order(dish,1)
    order.add_dish_to_order(dish,1)
    expect(order.orderlist[dish]).to eq 2
  end

  it "can display the order" do
    order = described_class.new(pricemanager)
    order.add_dish_to_order(dish,1)
    order.add_dish_to_order(dish,1)
    expect(order.publish_order).to eq "* Welcome to your order\n* Spinach Juice -> 2\n * TOTAL: 10"
  end

end
