# require 'order'

# describe Order do
#   let(:order){Order.new}

# it 'should have a list of selected dishes' do
# end

# it 'should have a quantity of each dish' do
# end

# it 'should have a total cost' do
# end

# it 'should have a minimum order value' do
# end

# it 'should reject an order that does not meet the minimum order value' do
# end

# it 'should inform a customer of a successful order via text' do
# end



# end


# Order - placing the order by giving:
# the list of dishes,
# their quantities
# a number that should be the exact total.
# If the sum does not meet the minimum delivery cost the method should raise an error,
# otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".

# The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
# Use twilio-ruby gem to access the API
# Use a Gemfile to manage your gems

# Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
# However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
# Phone

