require 'order'

describe Order do
	
	let(:menu_list) { { food1: 1, food2: 2} }
	let(:messenger) { double(:messenger, new: true, send_text: true) }
	let(:order) { described_class.new(menu_list,messenger) }

	context '#menu_list' do
		it 'initializes with a menu list' do
			expect(order.menu_list).to respond_to :each
		end
	end

	context '#add_to_order' do

		it 'can add an item to the order' do

			order.add_to_order(:food1,1)
			expect(order.ordered_items).to eq [[:food1, 1]]

		end

		it 'adds the running total to the order' do

			order.add_to_order(:food1,1)
			order.add_to_order(:food2,2)
			expect(order.running_total).to eq 5

		end

	end

	context '#total_correct?' do

		it 'checks if running total = correct total' do

			order.add_to_order(:food1,1)
			order.add_to_order(:food2,2)

			expect(order.total_correct?).to eq true

		end

	end

	context '#confirm_order' do

			it 'sends a text to the customer' do
			  expect(messenger).to respond_to :send_text
		  end
	end

end