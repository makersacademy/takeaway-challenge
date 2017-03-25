require 'menu'

describe Menu do
	subject(:menu) {described_class.new}
	let(:dish_name) {:dish_name}
  let(:price) {:price}
	let(:options) { {dish_name: "Dim sum", price: 2}}
  
  

  context 'when displaying menu' do
	  it 'contains dishes and prices' do
	    expect(menu.options).to eq options
	  end

    it 'has a dish name' do
  	  expect(menu.options).to include dish_name
    end
	end
end


