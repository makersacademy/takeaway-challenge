require 'confirmation'

describe Confirmation do
	checkout = {fish_and_chips: [5.99,2]}
	subject(:confirmation) {described_class.new(checkout)}
	let(:our_total) {11.98}
	let(:user_total) {15}

	context '#initialize' do
		it 'assigns checkout to a variable' do
			expect(confirmation.checkout).to eq checkout
		end
		it 'creates a variable to store the total' do
			expect(confirmation.total).to eq 0
		end
	end

	context '#user_cost' do
		it "should raise an error if totals don't match" do
			expect{confirmation(confirmation.user_cost(user_total))}.to raise_error "The totals don't match, ours: £#{our_total} yours: £#{user_total}!"
		end
	end

	context '#total_cost' do
		it 'calculates the total' do	
			confirmation.user_cost(our_total)
			expect(confirmation.total).to eq our_total
		end
	end
end