describe 'user_stories' do 

	let(:menu)		{ Menu.new }

	it 'allows the user to see a list of menu items' do
		
		# As a customer
		# So that I can check if I want to order something
		# I would like to see a list of dishes with prices

		takeaway = Takeaway.new(menu)
		expect(takeaway.view_menu).to eq(menu.print_menu)

	end
	
	
end