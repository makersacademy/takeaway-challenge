require 'menu'
require 'customer'
describe 'User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'menu returns a hash when asked to list dishes' do
    menu = Menu.new
     expect(menu.list).to be_an_instance_of(Hash)
   end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'lets customers select items from the menu' do
    customer = Customer.new
    customer.read_menu
    customer.order(item: :a, quantity: 1)
    expect(customer.basket).to be_an_instance_of(Array)
    # the above should be changed to expect basket to include the customer order above
  end


end


