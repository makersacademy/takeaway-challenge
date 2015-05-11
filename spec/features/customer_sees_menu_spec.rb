require 'welcome'
require 'customer'
require 'takeaway'

feature 'Customer checks out takeaway' do
  let (:customer) {Customer.new}

  before (:each) do
    customer.takeaway = Takeaway.new Menu, Order, Message_Handler
  end

  scenario 'and looks at the menu' do
    expect(customer.check_menu).not_to be_empty
  end

  scenario "they can add initial items to current order" do
    customer.add_item :FishAndChips
    expect(customer.takeaway.current_order).to eq [:FishAndChips => 5]
  end

  scenario "they can remove a selection before confirming" do
    customer.add_item :FishAndChips, 3
    customer.remove_order 2
    expect(customer.takeaway.current_order).to eq [{:FishAndChips => 5}, {:FishAndChips => 5}]
  end
end