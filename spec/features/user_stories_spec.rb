describe 'User stories' do
  let(:takeaway) {Takeaway.new}
  let(:menu) {Menu.new}
  let(:total) {6}

  before do
    allow(takeaway).to receive(:send_text)
  end

	# As a customer
	# So that I can check if I want to order something
	# I would like to see a list of dishes with prices
	context 'when making an order' do
	  it 'displays a menu' do
	  	menu = Menu.new
	  	dishes = { "Dim sum"=>2, "Fried rice"=>3, "Crispy chicken"=>4, "Pepper squid"=>5 }
	  	expect(takeaway.view_menu).to eq menu.dishes
	  end
  end

  context 'when displaying menu' do
	  it 'contains the list of dishes and prices' do
	  	raw_dish_database = { "Dim sum"=>2, "Fried rice"=>3, "Crispy chicken"=>4, "Pepper squid"=>5 }
	    expect(menu.dishes).to eq raw_dish_database
	  end
	end

	# As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  context 'when placing an order' do
    it 'displays empty orders if no orders added' do
    	expect(takeaway.orders).to be_empty
    end

	  it 'displays selected orders' do
	  	basket = {dish_name: "Dim sum", price: 2, amount: 3}
	  	takeaway.add_to_orders("Dim sum", 2, 3)
	  	expect(takeaway.orders).to eq [basket]
	  end

    it 'selects some number of several available dishes' do
  		basket = {dish_name: "Dim sum", price: 2, amount: 3}
      expect(takeaway.place_order("Dim sum", 3)).to eq [basket]
    end
  end

	# As a customer
	# So that I can verify that my order is correct
	# I would like to check that the total I have been given matches the sum of the various dishes in my order
  context 'when checking out' do
		it 'checks out the total' do
  		takeaway.add_to_orders("Dim sum", 2, 3)
  		takeaway.checkout
  		expect(takeaway.total).to eq 6
    end
  end

	# So that I am reassured that my order will be delivered on time
	# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  context 'when confirming order' do
  	it 'sends payment confirmation message' do
  		expect(takeaway).to receive(:send_text).with("Thank you for your order: £#{takeaway.total}")
  	  takeaway.complete_order
  	end
  end
end
