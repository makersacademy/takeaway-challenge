require 'takeaway'
require 'menu'
require 'order'

# describe 'User stories + feature tests: ' do

describe 'User Stories' do 

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

	describe '#read menu' do

	subject(:menu) {Menu.new(dishes)}

	let(:dishes) do
		{
		chicken: 3.99,
		falafel: 4.50
		}
	end

	it 'enables a customer to view a list of dishes with prices' do
		expect(menu.dishes).to eq(dishes)
	end
end

# As a customer
# So that I can check if I want to order something
# I would like to be able to select some number of several available dishes

	# describe '#order' do

		# subject(:takeaway) {Takeaway.new(menu: menu, order: order)}
		# let(:order) {double(:order)}

			# it 'can order some number of several available dishes' do
			# 	expect(order).to receive(:add).twice  
			# 	takeaway.place_order(dishes)
			# end

	# end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order


		

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52"

end