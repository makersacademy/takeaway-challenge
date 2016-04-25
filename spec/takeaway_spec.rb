require 'takeaway'

describe TakeAway do
	let(:menu) { spy(:menu) }
	let(:order) { spy(:order) }
	let(:order_double) { double(:order, total: 620)}
	let(:sms_provider) { spy(:sms_provider) }
	let(:takeaway) { described_class.new(menu, order, sms_provider) }

	describe '#read_menu' do
		it '#print is called on the menu object' do
			takeaway.read_menu
			expect(takeaway.menu).to have_received(:print)
		end
	end

	describe '#add_order' do
	  it '#add with 2 arguments is called on order' do
	  	takeaway.add_order(2, 2)
	  	expect(order).to have_received(:add)
	  end
	end

	describe '#order_summary' do
	  it '#summary is called on order' do
	  	takeaway.order_summary
	  	expect(order).to have_received(:summary)
	  end
	end

	describe '#confirm_order' do
	  it 'returns a message if incorrect total is passed' do
	  	message = "The total amout you have entered is incorrect, please try again."
	  	expect{takeaway.confirm_order(30)}.to raise_error message
	  end

	  it '#send_message' do
	  	takeaway = TakeAway.new(menu, order_double, sms_provider)
	  	takeaway.confirm_order(6.20)
	  	expect(sms_provider).to have_received(:send_message)
	  end
	end

end