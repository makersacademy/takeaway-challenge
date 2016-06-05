require 'restaurant'

describe Restaurant do

let(:new_menu) { double(:new_menu, :show_menu => { food1: 1, food2: 2}, :food_list => { food1: 1, food2: 2}) }
let(:order) { double(:order, :ordered_items => ["food"]) }
let(:restaurant) { described_class.new(new_menu, order) }

let(:restaurant2) { described_class.new(({ food1: 1, food2: 2}), order ) }

	context '#show_menu' do

		it 'shows the customer the menu' do
			expect(restaurant.show_menu).to eq ({:food1=>1, :food2=>2})
		end

	end

	context '#order_item' do

		it 'raises error if item not on the menu' do
			expect{restaurant.order_item(:poo)}.to raise_error "This item is not on the menu"
		end

	end

	context '#see_basket' do

		it 'shows the basket of ordered items' do
			expect(restaurant2.see_basket).to eq ["food"]
		end

	end

end