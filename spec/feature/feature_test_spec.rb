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
    time = Time.new
    customer.see_menu
    customer.place_order(1, "red curry")
    customer.ask_confirmation
    expect(customer.takeaway.set_confirmation).to eq ("Thank you! Your order was placed and will be delivered before #{(time.hour) +1}:#{time.min}. The amount due is 5$.")
  end

  # scenario 'customer receives confirmation via twilio' do
  #   takeaway = Takeaway.new { Twilio.new }



end



# classi
#   menu               takeaway                Customer

#   show_list           receive_order           place order
#                       write_bill              checks order
#                        send_message