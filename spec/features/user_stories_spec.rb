describe 'User stories' do
  let(:takeaway) {Takeaway.new}
  let(:menu) {Menu.new}
  let(:dish_name) {:dish_name}
  let(:price) {:price}
  let(:options) { {dish_name: "Dim sum", price: 2} }



	# As a customer
	# So that I can check if I want to order something
	# I would like to see a list of dishes with prices
	context 'when making an order' do
    it 'displays a menu' do
		  expect(takeaway.view(menu)).to eq menu
    end
  end

  context 'when displaying menu' do
	  it 'contains dishes and prices' do
	    expect(menu.options).to eq options
	  end

    it 'has a dish name' do
  	  expect(menu.options).to include dish_name
    end
	end


	
end
