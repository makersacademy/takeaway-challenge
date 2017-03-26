describe 'User stories' do
  let(:takeaway) {Takeaway.new}
  let(:menu) {Menu.new}
  let(:added_to_basket) {:added_to_basket}
  let(:raw_dish_database) { { "Dim sum"=>2, "Fried rice"=>3, "Crispy chicken"=>4, "Pepper squid"=>5 } } 
  let(:dish) {:dish}
  let(:number) {:number}
  let(:dish) {:dish}
  let(:price) {:price}
  let(:amount) {:amount}
  let(:basket) { {dish_name: dish, price: price, amount: amount} }
  
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

end
