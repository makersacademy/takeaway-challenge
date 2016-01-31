require 'takeaway'

Describe Takeaway do
	subject(:takeaway) { described_class.new }

	context '#menu' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
		
		takeaway.menu
	end
end