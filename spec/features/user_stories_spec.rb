
describe 'User Stories' do

  let(:takeaway) { Takeaway.new(menu) }
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  let(:checkout) { Checkout.new }
  let(:item) { Item.new('Satay', 4.50) }
  let(:item2) { Item.new('Spring rolls', 3.00) }
  let(:quantity) { 3 }


# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe 'Takeaway' do
  it 'allows the customer to view the menu with prices' do
    menu.add(item)
    expect(takeaway.view_menu).to include item
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes



  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  describe 'Sms' do
    xit 'sends an SMS confirmation when an order is placed' do
    end
  end
end

# # As a customer
# # So that I can verify that my order is correct
# # I would like to check that the total I have been given matches the sum of the various dishes in my order

# xit 'raises an error if the total does not equal the sum of items in the basket' do
#   basket.total to raise_error
# end
#
