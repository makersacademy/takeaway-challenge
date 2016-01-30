require 'dishes'

describe 'These are all the user stories' do 
	
# User Story 1
##############
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

	it 'I would like to see a list of dishes' do
		dishes = Dishes.new
		expect{dishes.list}.not_to raise_error
	end

# User Story 2
##############

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# 	it 'I would like to select some number of available dishes' do
# 		dishes = Dishes.new
# 		expect{dishes.select}.not_to raise_error
# 	end

#User Story 3
#############

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

	# it 'I would like to check the total amount of my dishes' do
	# 	dishes = Dishes.new
	# 	expect{dishes.total}.not_to raise_error
	# end

#User Story 4
#############
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text to say "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

# 	it 'I would like to receive a text, saying "Thank you! Your order was placed and will be delivered before 18:52", after I have ordered' do
	
# 	end
# end



