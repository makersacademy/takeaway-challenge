require 'order'

describe Order do
	subject(:order){described_class.new(menu)}
	let(:menu){double(:menu)}
	let(:number_dishes) { {jajangmyun: 1, bibimbap: 2} }
	before { allow(menu).to receive(:dish?).with(:jajangmyun).and_return(true)}
	before { allow(menu).to receive(:dish?).with(:bibimbap).and_return(true)}
	before { allow(menu).to receive(:price).with(:bibimbap).and_return(9.00)}
	before { allow(menu).to receive(:price).with(:jajangmyun).and_return(9.00)}
	it 'select some number of several available dishes' do
		order.log(number_dishes)
		expect(order.dishes).to eq number_dishes
	end
	it "raises an error when order not in menu" do
		allow(menu).to receive(:dish?).with(:pie).and_return(false)
		expect{order.log(pie:1)}.to raise_error "Pie is not in the menu"
	end

	it "calculate total price" do
		order.log(number_dishes)
		expect(order.total).to eq "Your total is £27.00"
	end

end