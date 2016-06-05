require 'menu'

describe Menu do 
	# it { should respond_to(:view) }
	it 'returns menu' do 
		expect(subject.view).to eq " 1:\t Pizza \t £7.99 \n 2:\t Prawn toast \t £1.5 \n 3:\t Butter chicken \t £3 \n 4:\t The kebab \t £4.9 \n 5:\t The burger \t £3.7 \n 6:\t Sushi \t £5 \n 7:\t Pasta \t £8 \n 8:\t Chicken tikka masala \t £4.5 \n 9:\t Crispy aromatic duck \t £5.75 \n10:\t Chow mein \t £2.99 \n11:\t Ice cream \t £3 \n12:\t Beer \t £2 \n"
	end
end