require 'capybara/rspec'
require 'order'

feature 'A customer wants to order takeaway' do
  scenario 'Customer is able to view list of dishes from the menu' do
  	order = Order.new
  	expect(order.print_menu).to be_a_kind_of(Hash)
  end

  scenario 'Customer is able to select multiple dishes from the menu' do
  	order = Order.new
  	order.add_dish 1, "Bottle of Water"
  	order.add_dish 2, "Carbonara"
  	expect(order.view_order).to eq [{"Bottle of Water" => 3.08}, {"Carbonara" => 0.4}, {"Carbonara" => 0.4}]
  end

  scenario 'Customer can view each dish alongside sum total of their order' do
    order = Order.new
    order.add_dish 2, "Bottle of Water"
    order.add_dish 3, "Ice cream"
    expect(order.order_price ).to eq 7.6
  end

  scenario 'Text is sent out via Twilio telling customer when their order will be likely to arrive' do
  end
end





#How does the menu know if the restaurant can't provide a particular dish?