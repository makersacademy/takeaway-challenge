# require 'menu'
# require 'order'
# require 'dish'


# describe 'these are the user stories' do
#
#   let(:menu) { Menu.new }
#   let(:takeaway) { Takeaway.new }
#   let (:dish1) { double :dish }
#
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
#end


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  # it 'select some number of several available dishes' do
    # expect{ takeaway.display_menu('Pie', 2) }.not_to raise_error
   # expect{ takeaway.select_dishes('Coffee', 'Apple Pie', 5) }.not_to raise_error
#end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
# OBJECT: order correct?
# MESSAGE: verify, total vs the sum of the various dishes ordered

# it 'should allow my customer to check that their order size matches the sum of dishes in order' do
#   order = takeaway.select_dishes('Coffee', 'Apple Pie', 5)
#   expect{ order.verify }.not_to raise_error
#   expect( order.verify ).to eq(2)
# end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as
#  "Thank you! Your order was placed and will be delivered before 18:52"
#  after I have ordered
# OBJECT: confirmation message upon order
# MESSAGE: receive text
# end
