require 'order'
require "menu"

describe Order do

	subject(:order) { described_class.new(menu) }

	let(:menu) { instance_double("Menu") }

	let(:dishes) do
		{
			pie: 2,
			sandwich: 1
		}
	end

	before do
    	allow(menu).to receive(:has_dish?).with(:pie).and_return(true)
    	allow(menu).to receive(:has_dish?).with(:sandwich).and_return(true)

    	allow(menu).to receive(:price).with(:pie).and_return(5.99)
    	allow(menu).to receive(:price).with(:sandwich).and_return(3.29)
  	end	

  	it "selects several dishes from the menu" do
    	create_order
    	expect(order.dishes).to eq(dishes)
  	end

	it 'not allowing items which are not on the list' do
    	allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    	expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  	end

  	it "calculates the total for the order" do
    	create_order
    	total = 15.27
    	expect(order.total).to eq(total)
  	end

  	def create_order
    	order.add(:pie, 2)
    	order.add(:sandwich, 1)
  	end  		

end
