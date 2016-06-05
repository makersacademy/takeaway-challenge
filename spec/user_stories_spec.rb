require 'menu'
require 'takeaway'


describe 'user stories' do

	let(:item) { double(:item) }
	let(:qty) { double(:qty) }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

	it "so we can check if we want to order something, we read the menu" do
		menu = Menu.new 
		takeaway = Takeaway.new
		expect { takeaway.read_menu }.not_to raise_error
	end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

	it "so we can order a meal, we select several available dishes from the menu" do
		menu = Menu.new
		takeaway = Takeaway.new
		order = Order.new
		expect { takeaway.add_item(item, qty) }.not_to raise_error
	end

end

