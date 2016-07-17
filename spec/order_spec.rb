require 'order'

describe Order do
	let(:dish) { double :dish, get_name: "Burger", get_price: "10" } 
	let(:menu) { double :menu, dishes: [dish], list_dishes: [dish] }
	subject { described_class.new(menu: menu) }
	
	context "#read_menu" do
		it "reads a menu" do
			expect(subject.read_menu).to eq menu.dishes
		end
	end
	
	context "#select_dish" do
		it "adds a dish to your basket" do
			subject.select_dish(dish.get_name, 1)
			expect(subject.basket_summary).to include dish
		end
		it "adds a specified quantity of a dish to your basket" do
			subject.select_dish(dish.get_name, 1)
			subject.select_dish(dish.get_name, 3)
			expect(subject.basket_summary[dish]).to eq 4
		end
	end

	# context "#check_total" do
		
		
	# end

end