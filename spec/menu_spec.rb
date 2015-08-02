require 'menu'
require 'dish'

describe Menu do 

	let(:dish1) { double (:dish), name: "pasta", price: 5 }
	let(:dish2) { double (:dish), name: "veal", price: 10 }

	# it 'adds a dish to the menu' do
	# expect(subject.add_dish dish).to 
	# end 

	it 'raises an error if the dish does not belong to the menu' do
	subject.add_to_menu dish2
	expect{subject.select_dish dish1, 2}.to raise_error 'This dish does not belong to the menu'
	end

	it'allows select a dish from the menu' do
		subject.add_to_menu dish1
		expect(subject.select_dish dish1, 2).to eq [["pasta", 5, 2]] 	
	end

	
end