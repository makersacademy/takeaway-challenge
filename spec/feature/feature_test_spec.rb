require 'menu'
require 'takeaway'
require 'customer'

feature 'as a customer I want to order from a takeaway' do
  scenario 'a menu is available' do
    customer = Customer.new { Takeaway.new }
    expect(customer.see_menu).to eq ({'red curry' => 5, 'green curry' => 5})
  end

  scenario 'an order can be placed' do
    customer = Customer.new { Takeaway.new }
    customer.see_menu
    customer.place_order(2, "red curry")
    expect(customer.takeaway.order).to eq ( [{"red curry"=>5}, {"red curry"=>5}])
  end

  scenario 'an order is placed and the customer receives the total amount' do
    customer = Customer.new { Takeaway.new }
    customer.see_menu
    customer.place_order(1, "red curry")
    customer.place_order(2, "green curry")
    expect(customer.confirm_order).to eq {"your oder was placed total amount due is 15$"}
  end
end



# classi
#   menu               takeaway                Customer

#   show_list           receive_order           place order
#                       write_bill              checks order
#                        send_message