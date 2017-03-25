describe 'User stories' do
  let(:takeaway) {Takeaway.new}
  let(:menu) {Menu.new}

  let(:raw_dish_database) { { dim_sum: 2, fried_rice: 3, crispy_chicken: 4, pepper_squid: 5 } } 

	# As a customer
	# So that I can check if I want to order something
	# I would like to see a list of dishes with prices
	context 'when making an order' do
	  it 'displays a menu' do
	  	expect(takeaway.view_menu).to eq menu.dishes
	  end
  end

  context 'when displaying menu' do
	  it 'contains the list of dishes and prices' do
	    expect(menu.dishes).to eq raw_dish_database
	  end
	end
end
