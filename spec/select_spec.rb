require 'select.rb'

describe Select do
		let(:burger){double (:burger)}
		it 'shows the menu' do 
			men = {'Burger'=> 10, 'Pint'=> 4.50,'Steak'=>18,'Wine'=> 22,'Chips'=> 3.25}
			expect(subject.menu).to eq men
		end
		it 'shows the menu' do 
			men = {'Burger'=> 10, 'Pint'=> 4.50,'Steak'=>18,'Wine'=> 22,'Chips'=> 3.25}
			expect(subject.see).to eq men
		end

		it 'has an order' do
 			expect(subject).to respond_to(:order)
		end
		it 'has an due amount' do
 			expect(subject).to respond_to(:order)
 		end

		describe 'pick' do 
			it 'take an argument for dish and argument for quantity' do 
				allow(subject).to receive(:pick).with(2).and_return(2)
				expect(subject.pick(2)).to eq(2)
			end
			it 'raise an error when there dish is not in the menu' do 
				expect {subject.pick('water')}.to raise_error 'this dish is not in the menu'
			end
			it 'creates an order with the item selected, price and its quantity' do 
				ord = {"5 Burger" => {"10£ each"=>"50£"}}
				subject.pick('Burger',5)
				expect(subject.order).to eq ord
			end
		end
			
		describe 'bill' do 
			it 'has a bill' do 
				expect(subject).to respond_to(:order)
			end
			it 'will show the bill for checking the prices and the sum' do 
				subject.pick('Burger',3)
				subject.pick('Steak',2)
				expect(subject.bill). to eq "Due 66£"
			end
		end

		describe "#place_order" do
			it 'place an order and get it before 18:52" after ordering' do 
				t = Time.now + 1132
				msg = "Thank you! Your order will be delivered before #{t.strftime('%H:%M')}"
				expect(subject.place_order).to eq msg
			end
		end


end
	


