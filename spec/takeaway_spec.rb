require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do

	subject(:takeaway) { described_class.new }

	let(:menu) { double(:menu, item_price: {"veggie" => 4.00}) }

	it "can list a menu of items and prices" do
		expect(takeaway.read_menu).to eq Menu::STANDARD_MENU
	end

	describe '#add_item' do

		it "adds item to order" do
			takeaway.add_item("veggie", 2)
			expect(takeaway.include?("veggie")).to eq true 
		end

	end

	describe '#order_price' do

		it "prints the total price of the order" do
			takeaway.add_item("veggie", 2)
			expect(takeaway.total_price).to eq "The price of your order is £8.0"
		end
		
	end

end