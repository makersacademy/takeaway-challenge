require 'customer'
require 'takeaway'

feature "Customer finds Takeaway" do
  let (:customer) {Customer.new{Takeaway.new}}
  scenario "and looks at the menu" do
    expect(customer.check_menu).to_not be_empty
  end

  scenario "and adds an item from the menu to an order" do
    customer.select_item :FishAndChips, 1
    expect(customer.takeaway.orders).to eq [:FishAndChips => 5]
  end

  scenario "can check items selected in order" do
    customer.select_item :FishAndChips, 1
    customer.select_item :MeatAndTwoVeg, 1
    expect(customer.takeaway.orders).to eq [{:FishAndChips => 5}, {:MeatAndTwoVeg => 7}]
  end

  scenario "can check the total price of items in an order" do
    customer.select_item :FishAndChips, 1
    customer.select_item :MeatAndTwoVeg, 1
    expect(customer.check_order_total).to eq 12
  end

  scenario "can remove items from the order" do
    customer.select_item :FishAndChips, 2
    customer.remove_previous_order
    expect(customer.check_order_total).to eq 5
  end
end