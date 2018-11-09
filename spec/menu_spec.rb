require 'menu'
require 'dish'

describe Menu do
	let(:dish1) {double("chicken", :name => "chicken", :price => 1.99)}
	let(:dish2) {double("wings", :name => "wings", :price => 2.99)}

	it 'should be able to add dishes to menu' do
		subject.add_dish(dish1)
		expect(subject.available_dishes).to include(dish1)
	end

	it 'should be able to store multiple dishes' do
		subject.add_dish(dish1)
		subject.add_dish(dish2)

		expect(subject.available_dishes).to include(dish1, dish2)
	end

	it 'should return the name and price of a dish' do
		subject.add_dish(dish1)

		expect{subject.show_menu}.to output("1.#{dish1.name} - #{dish1.price}\n").to_stdout
	end

	it 'should return the name and price of multiple dishes' do
		subject.add_dish(dish1)
		subject.add_dish(dish2)

		expect{subject.show_menu}.to output("1.#{dish1.name} - #{dish1.price}\n2.#{dish2.name} - #{dish2.price}\n").to_stdout
	end
end