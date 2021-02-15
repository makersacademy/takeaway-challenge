require 'order'

describe Order do
		let(:ramen) { double :dish, name: "Ramen", price: 8 }
		let(:pizza) { double :dish, name: "Pizza", price: 12 }
		let(:beer) { double :dish, name: "Beer", price: 4 }
		let(:rice) { double :dish, name: "Rice", price: 3 }
		
		describe '#initialize' do
				it 'should provide a cart for each Order' do
						expect(subject.cart).to be_a Array
				end
		end

		describe '#total' do
				it 'should return a number' do
						expect(subject.total).to be_a Integer
				end

				context 'when the cart is full' do
						it 'should return the total price of all items' do
								subject.cart << pizza
								expect(subject.total).to eq 12
						end
				end

				context 'when the cart is empty' do
						it 'should return a total of 0' do
								expect(subject.total).to be 0
						end
				end
		end

		describe '#view_order' do
				it 'should return a string' do
						expect { subject.view_order } .to output(String).to_stdout
				end
		end

		describe '#confirm_order' do
				it 'should return a message when an order is confirmed' do
						expect { subject.confirm_order } .to output(String).to_stdout
				end

				it 'should reset the cart after placing the order' do
						subject.cart << pizza
						expect { subject.confirm_order } .to change { subject.cart.count } .by(-1)
				end
		end
end
