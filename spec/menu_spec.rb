require 'menu'

describe Menu do
	let(:list){ {food1: 1, food2: 2, food3: 3} }
	let(:list2){ {food1: 4, food2: 5, food3: 6} }
	subject(:menu){described_class.new(list)}

	it 'reformats the list of dishes and prices provided on initialization' do
		expect(menu.list).to eq({ :food1=>{:price=>1}, :food2=>{:price=>2}, :food3=>{:price=>3} })
	end

	it 'allows the list to be updated with the same reformatting' do
		menu.list=list2
		expect(menu.list).to eq({ :food1=>{:price=>4}, :food2=>{:price=>5}, :food3=>{:price=>6} })
	end

end