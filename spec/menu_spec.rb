require 'menu'

describe Menu do

let(:schnitzel){double :dish, name: "Schnitzel", price: 4}
let(:pie){double :dish, name: "pie", price: 2}
let(:menu){Menu.new}
let(:customer){double :customer, name: "Thomas", tel: "+44test"}
let(:order){double :order, total: 2, dishes: [schnitzel, pie]}
let(:fail_order){double :order, total: 1, dishes: [schnitzel, pie]}
let(:texttool){double :texttool, recipients: []}
  

  it "can contain dishes" do
    menu.add_dish(schnitzel)
    expect(menu.dishlist).not_to be_empty
  end

  it "can receive an order" do
    menu.custom_order(customer, order)
    expect(menu.ordered).to eq(order.dishes)
  end

  it "returns an error if total number of customer's order is not correct" do
    expect{menu.custom_order(customer, fail_order)}.to raise_error(RuntimeError, 'Please check the sum of your ordered dishes')
  end

  it "can hand over customer information to TextTool" do
    expect(menu).to receive(:inform_customer).with(customer).and_return("Message has been sent")
    menu.inform_customer(customer) 
  end

  
end