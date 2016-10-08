require 'interface'
require 'menu'

describe Interface do
	
	describe '#initialize' do

		it 'sets the menu class to be a menu' do
			expect(subject.menu_class).to eq(Menu)
		end

		it 'sets the menu to an instance of the menu class' do
			expect(subject.menu).to be_a(Menu)
		end

		it 'sets the order_class to Order' do
			expect(subject.order_class).to eq(Order)
		end
	end

	describe '#display_menu' do

		it 'puts strings to the screen' do
			10.times {expect(STDOUT).to receive(:puts)}
			subject.display_menu
		end

	end

	describe '#place_order' do


	end

	describe '#new_order' do

		it 'creates a new order' do
			expect(subject.new_order).to be_a(Order)
		end

	end

	describe '#get_item_input' do

		it 'gets input from the user' do
		
		end

	end

	describe '#add_items_to_order' do

		let(:order) { double(:order, current_order: [])}

		it 'updates the current orders items' do
			initial_count = subject.current_order.count
			subject.add_items_to_order(order,[1,2])
			expect(subject.current_order.count).to be > initial_count
		end

	end
end