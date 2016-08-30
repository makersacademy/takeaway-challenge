require 'menu'

describe Menu do 
	# it { should respond_to(:view) }
	it 'returns menu' do 
		expect(subject.view).to eq "No.\tPrice\t\tDish \n---------------------------------------------\n 1:\t£7.99\t-\tPizza \n 2:\t£1.50\t-\tPrawn toast \n 3:\t£3.00\t-\tButter chicken \n 4:\t£4.90\t-\tThe kebab \n 5:\t£3.70\t-\tThe burger \n 6:\t£5.00\t-\tSushi \n 7:\t£8.00\t-\tPasta \n 8:\t£4.50\t-\tChicken tikka masala \n 9:\t£5.75\t-\tCrispy aromatic duck \n10:\t£2.99\t-\tChow mein \n11:\t£3.00\t-\tIce cream \n12:\t£2.00\t-\tBeer \n"
	end
end