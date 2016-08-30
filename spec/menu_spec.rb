require 'menu'

describe Menu do
	let(:name) { double :name }
	let(:price) { double :price }
	let(:dish) { double :dish, get_name: name, get_price: price }

	before { subject.add(dish) }

	context "#add" do
		it "should add a dish to the menu" do
			subject.add(dish)
			expect(subject.list_dishes).to include dish
		end
	end

end