require 'menu'

describe Menu do
	let(:name) { double :name }
	let(:price) { double :price }
	let(:dish) { double :dish, name: name, price: price}


	context "#add" do
		it "should add a dish to the menu" do
			subject.add(dish)
			expect(subject.read_menu).to include dish
		end
	end

	before { subject.add(dish) }

	context "#order" do
		it "should add a chosen dish to your basket" do
			subject.order(dish)
			expect(subject.basket_summary).to include dish 
		end

		it "should add multiple servings of a dish when quantity is specified" do
			expect{ subject.order(dish, 3) }.to change{ subject.basket_summary.length }.by 3
		end
		
	end


end