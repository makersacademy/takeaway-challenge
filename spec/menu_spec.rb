require 'menu'

describe Menu do

let(:schnitzel){double :dish, name: "Schnitzel", price: 4}
let(:pie){double :dish, name: "pie", price: 2}
let(:menu){Menu.new}
let(:customer){double :customer}
let(:order){double :order, orders: [schnitzel, pie]}

  it "can contain dishes" do
    menu.add_dish(schnitzel)
    expect(menu.dishlist).not_to be_empty
  end

  it "can receive an order" do
    menu.custom_order(order.orders)
    expect(menu.ordered).to eq(order.orders)
  end

  
end