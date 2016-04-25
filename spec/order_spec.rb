
require 'order'

describe Order do
	subject(:order) {described_class.new(menu)}
	let(:menu) {double :menu}
	let(:dishes) do
		{
			kurma: 4.80, 
			 madras: 4.50,
			 vindaloo: 5.00

		}
	end

	it 'selects available dishes' do 
		order.add(:kurma, 4.80)
		order.add(:madras, 4.50)
		order.add(:vindaloo, 5.00)
		expect(order.dishes).to eq dishes
	end

	it 'adds to dishes and their quantities together to give the total' do
		stub
		create_order
		total = 14.30
		expect(order.order_total).to eq total
	end

	def create_order
		order.add(:kurma, 1)
		order.add(:madras, 1)
		order.add(:vindaloo, 1)
	end

	def stub
		allow(menu).to receive(:price).with(:kurma).and_return(4.80)
		allow(menu).to receive(:price).with(:madras).and_return(4.50)
		allow(menu).to receive(:price).with(:vindaloo).and_return(5.00)
	end

end