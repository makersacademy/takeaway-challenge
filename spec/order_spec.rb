require "order"

describe Order do

  let(:dish) { double :dish, :publish_dish => "Spinach Juice", :category => "drink" }
  let(:pricemanager) { double :pricemanager, :calculate_order_value => 10 }
  let(:text) {double :text, :send_text => true}
  subject(:order) { described_class.new(pricemanager,text) }

  it "adds items to the order" do
    #allow(stdio).to receive(:gets){"1"}
    order.add_dish_to_order(dish, 1)
    expect(order.orderlist.length).to eq 1
  end

  it "increments quantities to the order" do
    order.add_dish_to_order(dish, 1)
    order.add_dish_to_order(dish, 1)
    expect(order.orderlist[dish]).to eq 2
  end

  it "can display the order while delegating the total price calculation or PriceManager class" do
    order = described_class.new(pricemanager)
    order.add_dish_to_order(dish, 1)
    order.add_dish_to_order(dish, 1)
    expect(order.publish_order).to eq "   * Welcome to your order    \n* Spinach Juice -> 2\n* TOTAL AMOUNT: 10"
  end

  it "delegates the confirmation of order to Text class by placing a text" do
    expect(text).to receive(:send_text)
    order.confirm_order()
  end

end
