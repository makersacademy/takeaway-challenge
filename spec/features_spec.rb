
require 'order'
require 'send_sms'

describe 'Features' do

	let(:order) {Order.new}
	

	# As a customer
	# So that I can check if I want to order something
	# I would like to see a list of dishes with prices

	it 'listing out the available dishes on a table' do
		menu = Menu.list
	# 	menu.show 
	# 	table = Terminal::Table :rows
	# 	expect(table).to eq  ["One", 1]
	end

	# As a customer
	# So that I can order the meal I want
	# I would like to be able to select some number of several available dishes

	it 'allows user to select dishes wanted' do
		order.place_order(3,2)
	expect{order.order_list[0]}.not_to raise_error
	end

	it 'shows user all order details including total payment amount' do
		order.place_order(3,2)
		expect{order.order_table}.not_to raise_error
	end

	xit 'checks the paid amount with the listing payment amount' do
		order.place_order(3,2)
		order.order_table
		expect{order.pay(9.18)}.to raise_error "Right amount paid"
	end

	it 'print a menu for the user showing available dishes' do
		expect{Menu.list}.not_to raise_error
	end

	xit 'allows users to receive a messege when order was placed' do
		SMS.send
	end
end