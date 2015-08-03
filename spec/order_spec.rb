require 'order'

describe Order do

	let(:dish) {double :dish }
  let(:restaurant) { double :restaurant }
	
	context 'selecting a dish' do
		it { is_expected.to respond_to(:select_dish) }

		it 'selects dishes from menu' do
	    expect(subject.select_dish('salmon sashimi', 2)).to eq(2)
	  end

	  it 'cannot select dishes that are not on the menu' do
	  	expect{subject.select_dish('fois gras', 2)}.to raise_error "We don't serve that item, sorry!"
	  end
	end

	context 'calculating and checking totals' do
		it { is_expected.to respond_to(:print_receipt) }

		it 'should return total cost of order' do
			subject.select_dish('salmon sashimi', 2)
			expect(subject.print_receipt).to eq("Total cost of your meal is £#{'%.2f' % 8.00}")
		end

		it 'should raise error if order list is empty' do
			expect{subject.print_receipt}.to raise_error "You have not selected any items"
		end
	end

	context 'placing order' do
		it 'should raise error if order list is empty' do
			expect{subject.place_order}.to raise_error "You have not selected any items"
		end

		it 'should send message once order has been placed' do
      subject.select_dish('salmon sashimi', 2)
      expect(restaurant).to receive(:send_confirmation_text)
      subject.place_order
    end
	end
	
end