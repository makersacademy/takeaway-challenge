require 'restaurant'

describe Restaurant do

let(:new_menu) { double(:new_menu, :show_menu => { food1: 1, food2: 2}) }
let(:order) { double(:order, :ordered_items => []) }
let(:restaurant) { described_class.new(new_menu, order) }

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
end