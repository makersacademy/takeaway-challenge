require 'select.rb'

describe Select do
		let(:burger){double (:burger)}
		# let(:pint){double (:pint)}
		# let(:ord) {{ burger:1, pint:1}}
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

		describe 'pick' do 
			it 'take an argument for dish and argument for quantity' do 
				allow(subject).to receive(:pick).with(2).and_return(2)
				expect(subject.pick(2)).to eq(2)
			end
			it 'raise an error when there dish is not in the menu' do 
				expect {subject.pick('water')}.to raise_error 'this dish is not in the menu'
			end
			it 'creates an order with the item selected and its quantity' do 
				ord = {"Burger"=>5}
				subject.pick('Burger',5)
				expect(subject.order).to include ord
			end
			it 'will show the bill for checking the prices and the sum' do 
				ord = {"Burger"=>5, "Steak"=>2}
				subject.pick('Burger',5)
				subject.pick('Steak',2)
				expect(subject.bill). to eq 56
			end
		end


end
	


