require 'menu'

describe Menu do

	let(:list){ './lib/sample_menu.txt' }
	let(:list2){ './lib/sample_menu_2.txt' }
	subject(:menu){described_class.new(list)}

	it 'converts a file provided on initialization into a hash with the correct formatting' do
	 	expect(menu.list).to eq({ :Margherita=>{:price=>8}, :Pepperoni=>{:price=>10}, :Mexican_Special=>{:price=>12}, :Tuna_and_Sweetcorn=>{:price=>11.5} })
	end

	it 'allows the list to be updated with the same reformatting' do
	 	menu.list=list2
		expect(menu.list).to eq({ :Mushroom=>{:price=>7}, :Hawaiian_Special=>{:price=>12}, :Meatball_Grossout=>{:price=>15.99} })
	end

end