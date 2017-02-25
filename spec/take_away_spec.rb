require 'take_away'

describe TakeAway do
subject(:takeaway){described_class.new(menu)}
let(:menu) { (:menu) }
	context 'order validation' do
		it 'confirm the dish name' do

		end
		it 'confirm the quantity of the dishes' do

		end
		it 'should check and validate more than 1 dishes' do

		end
	end		# order validation context

	context 'validate customer' do
		it 'should confirm the customer name' do

		end
		it 'should check the customer phone number' do

		end
		it 'should confirm the address' do

		end

	end		# => customer validation context

	context 'order delegation' do
		it 'check if the items passed' do

		end
		it 'checks the processed order' do

		end
		it 'confirm the delivery' do

		end
		it 'confirm the text message sent' do

		end


	end		# order delegation context


end		# class TakeAway describe
