
require 'order'

describe Order do
	subject(:order) {described_class.new}
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
end