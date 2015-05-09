

feature 'customer can check menu' do

  scenario 'customer can check a menu with prices' do
    restaurant = Restaurant.new
    customer = Customer.new
    customer.checks_menu
    expect(customer.checks_menu).to be(@dishes)
  end
end