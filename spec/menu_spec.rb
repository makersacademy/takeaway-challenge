require 'menu'

describe Menu do

let(:schnitzel){double :dish, name: "Schnitzel", price: 4}
let(:pie){double :dish, name: "pie", price: 2}
let(:menu){Menu.new}
let(:customer){double :customer}
let(:order){double :order, order_sum: 2, dishes: [schnitzel, pie]}
let(:fail_order){double :order, order_sum: 1, dishes: [schnitzel, pie]}

  it "can contain dishes" do
    menu.add_dish(schnitzel)
    expect(menu.dishlist).not_to be_empty
  end

  it "can receive an order" do
    menu.custom_order(order.dishes, 2)
    expect(menu.ordered).to eq(order.dishes)
  end

  it "returns an error if total number of customer's order is not correct" do
    expect{menu.custom_order(fail_order.dishes, 1)}.to raise_error(RuntimeError, 'Please check the sum of your ordered dishes')
  end
  
end