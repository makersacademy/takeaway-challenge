require 'menu'
require 'takeaway'


describe 'user stories' do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

	it "so we can check if we want to order something, we read the menu" do
		menu = Menu.new 
		takeaway = Takeaway.new
		expect { takeaway.read_menu }.not_to raise_error
	end

end

