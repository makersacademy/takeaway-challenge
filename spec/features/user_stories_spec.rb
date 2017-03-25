describe 'User stories' do
    let(:takeaway) {Takeaway.new}
    let(:menu) {Menu.new}



	# As a customer
	# So that I can check if I want to order something
	# I would like to see a list of dishes with prices
	it 'displays a list of dishes and prices' do
		expect(takeaway.view(menu)).to eq menu
	end
	
end
