require 'order'
require "menu"

describe Order do

	subject(:order) { described_class.new(menu) }

	let(:menu) { instance_double("Menu") }

	let(:dishes) do
		{
			pie: 5.99,
			sandwich: 3.29
		}
	end

	before do
    	allow(menu).to receive(:has_dish?).with(:pie).and_return(true)
    	allow(menu).to receive(:has_dish?).with(:sandwich).and_return(true)
  	end	

	it "selected number of dishes from menu" do
		order.add(:pie, 5.99)
		order.add(:sandwich, 3.29)
		expect(order.dishes).to eq(dishes)
	end

	it 'not allowing items which are not on the list' do
    	allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    	expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  	end	

end
