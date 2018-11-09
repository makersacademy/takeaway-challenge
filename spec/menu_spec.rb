require 'menu'
require 'dish'

describe Menu do
	let(:dish1) {double("chicken", :name => "chicken", :price => 1.99)}
	let(:dish2) {dish2 = double(:name => "wings", :price => 2.99)}

	it 'should be able to add dishes to menu' do
		subject.add_dish(dish1)
		expect(subject.available_dishes).to include(dish1)
	end

	it 'should be able to store multiple dishes' do
		subject.add_dish(dish1)
		subject.add_dish(dish2)

		expect(subject.available_dishes).to include(dish1, dish2)
	end

	it 'should be able to output the available dishes' do
		subject.add_dish(dish1)

		expect(subject.show_menu).to eql(dish1.name)
	end
end