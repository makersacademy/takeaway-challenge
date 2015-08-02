require 'order'

describe Order do
	
	context 'selecting a dish' do
		it { is_expected.to respond_to(:select_dish) }

		it 'selects dishes from menu' do
	    expect(subject.select_dish('salmon sashimi', 1)).to eq(1)
	  end

	  it 'cannot select dishes that are not on the menu' do
	  	expect{subject.select_dish('fois gras', 2)}.to raise_error "We don't serve that item, sorry!"
	  end
	end

	context 'calculating and checking totals' do
		it { is_expected.to respond_to(:total_cost) }

		it 'should return total cost of order' do
			subject.select_dish('salmon sashimi', 2)
			expect(subject.total_cost).to eq("Total cost of yout meal is £#{8.00}")
		end

		it 'should raise error if order list is empty' do
			expect{subject.total_cost}.to raise_error "You have not selected any items"
		end
	end

	context 'placing order' do

	end
	
end