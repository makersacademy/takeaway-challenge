require 'customer'
require 'takeaway'

feature "Customer finds Takeaway" do
  scenario "and looks at the menu" do
    customer = Customer.new{Takeaway.new}
    expect(customer.check_menu).to_not be_empty
  end

  scenario "and adds an item from the menu to an order" do
    customer = Customer.new{Takeaway.new}
    customer.select_item :Fish, 1
    expect(customer.takeaway.orders).to eq [:Fish => 5]
  end

  scenario "can check items selected in order" do
    customer = Customer.new{Takeaway.new}
    customer.select_item :Fish, 1
    customer.select_item :Meat, 1
    expect(customer.takeaway.orders).to eq [{:Fish => 5}, {:Meat => 7}]
  end

  scenario "can check the total price of items in an order" do
    customer = Customer.new{Takeaway.new}
    customer.select_item :Fish, 1
    customer.select_item :Meat, 1
    expect(customer.check_order_total).to eq 12
  end
end