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
    expect(customer.basket).to eq [{:a=>10}]
    # the above should be changed to expect basket to include the customer order above

    #ADD it 'raises an error telling the customer that they must include an item and a quantity if they do not do so'

  end

  # As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'lets customers checkout their order if they enter the correct total' do
    customer = Customer.new
    customer.order(item: :a, quantity: 1)
    expect { customer.checkout(10) }.to output('Order complete, thanks!').to_stdout


  end

  it 'raises an error if a customer enters the wrong total when trying to checkout their order' do
    customer = Customer.new
    customer.order(item: :a, quantity: 1)
    expect { customer.checkout(9) }.to raise_error('Your expected total amount due is not correct. Please try to checkout again')
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  xit 'sends a text to the customer confirming the order has been placed' do
    customer = Customer.new
    customer.order(item: :a, quantity: 1)
    expect { customer.checkout(10) }.to output('Text message sent')
  end







end


