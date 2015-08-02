require 'menu'
require 'dish'
require 'customer'

describe Customer do

let(:dish1) { double (:dish), name: "pasta", price: 5 }

	it 'can the total amount to pay' do
		subject.meal.add_to_menu dish1
		subject.meal.select_dish dish1, 2
		expect(subject.total).to eq 10 
	end
	
end