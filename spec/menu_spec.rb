# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'menu'

describe Menu do
	subject(:menu) { described_class.new }

it 'should have a list of dishes with prices' do
	expect(menu.list).to eq ({"salad": 3, "burger": 6, "sandwich": 4, "wrap": 5, "chicken": 6, "chips": 3, "soda": 1})

end 


end 