describe 'User stories' do
  let(:takeaway) {Takeaway.new}
  let(:menu) {Menu.new}
  let(:checkout) {:checkout}
  let(:added_to_basket) {:added_to_basket}
  let(:raw_dish_database) { { "Dim sum"=>2, "Fried rice"=>3, "Crispy chicken"=>4, "Pepper squid"=>5 } } 
  let(:dish) {:dish}
  let(:number) {:number}
  let(:dish) {:dish}
  let(:price) {:price}
  let(:amount) {:amount}
  let(:basket) { {dish_name: dish, price: price, amount: amount} }
  let(:total) {:total} 

  before do
    allow(takeaway).to receive(:send_text)
  end

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

	# As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  context 'when placing an order' do
  	context 'when checking basket' do
      it 'displays empty orders if no orders added' do
      	expect(takeaway.orders).to be_empty
      end

  	  it 'displays selected orders' do
  	  	takeaway.add_to_orders(dish, price, amount)
  	  	expect(takeaway.orders).to eq [basket]
  	  end
  	end
  end

	# As a customer
	# So that I can verify that my order is correct
	# I would like to check that the total I have been given matches the sum of the various dishes in my order
  # context 'when checking out' do
  #   it 'checks out the total' do
	 #    takeaway.add_to_orders(dish, price, amount)
	 #    allow(takeaway).to receive(:checkout).and_return :total
	 #  	expect(takeaway.checkout).not_to be_empty
	 #  end
  # end


	# So that I am reassured that my order will be delivered on time
	# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  context 'when confirming order' do
  	it 'sends payment confirmation message' do
  		expect(takeaway).to receive(:send_text).with("Thank you for your order: £#{takeaway.total}")
  	  takeaway.complete_order
  	end
  end
end
