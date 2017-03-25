require 'menu'

describe Menu do
	subject(:menu) {described_class.new}
  let(:raw_dish_database) { { dim_sum: 2, fried_rice: 3, crispy_chicken: 4, pepper_squid: 5 } } 
  
  context 'when displaying menu' do
	  it 'contains the list of dishes and prices' do
	    expect(menu.dishes).to eq raw_dish_database
	  end

	end
end


