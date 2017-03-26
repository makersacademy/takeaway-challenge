require 'menu'

describe Menu do
	subject(:menu) {described_class.new}
  let(:raw_dish_database) { { "Dim sum"=>2, "Fried rice"=>3, "Crispy chicken"=>4, "Pepper squid"=>5 } } 
  
  context 'when displaying menu' do

	  it 'contains the list of dishes and prices' do
	    expect(menu.dishes).to eq raw_dish_database
	  end

	end
end


