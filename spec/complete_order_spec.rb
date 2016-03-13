require 'complete_order'

describe CompleteOrder do 

let(:customer1) {double :customer1, :number => "02749274"}
let(:message) {double :message, :send_sms => "Your order has been successful." }
let(:messenger) {double( :messenger, :new => message)}
let(:order) {double :order, :my_order => {{"apple"=>3}=>6, {"pear"=>4}=>2}, :customer => customer1 }
let(:order1) {double :order1, :my_order => {} }
subject(:completeorder) { CompleteOrder.new(order, messenger) }
subject(:completeorder1) { CompleteOrder.new(order1, messenger) }
	
	describe '#total_cost' do

		it 'returns the correct total of the completeorder' do
			expect(completeorder.total_cost).to eq 26
		end
	
	end

	describe '#completed' do

		it 'fails when the order is empty' do
			expect{completeorder1.completed}.to raise_error "You have nothing in your basket."
		end

		it 'sends a message if it is successful' do
			expect(completeorder.completed).to eq "Your order has been successful."
		end

	end

end