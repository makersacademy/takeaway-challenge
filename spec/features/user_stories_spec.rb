# require 'menu'
# require 'order'
# require 'dish'


# describe 'these are the user stories' do
#
#   let(:menu) { Menu.new }
#   let(:takeaway) { Takeaway.new }
#   let (:dish1) { double :dish }
#
#1.
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
#object: takeaway, menu
#messages: display_menu
#2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
#object: order, menu
#messages: add dish with its quantity, select_dishes

#3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
# OBJECT: takeaway, order
# MESSAGE: total, verify_total,

# it 'should allow my customer to check that their order size matches the sum of dishes in order' do
#   order = takeaway.select_dishes('Coffee', 'Apple Pie', 5)
#   expect{ order.verify }.not_to raise_error
#   expect( order.verify ).to eq(2)
# end

#4
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as
#  "Thank you! Your order was placed and will be delivered before 18:52"
#  after I have ordered
# OBJECT: confirmation message upon order
# MESSAGE: send text via sms
# end
