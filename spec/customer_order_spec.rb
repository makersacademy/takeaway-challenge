require 'customer_order'

describe 'CustomerOrder' do 

let(:dish1) {double :dish1, :item => "item1", :price => 2 }
let(:dish2) {double :dish2, :item => "item2", :price => 3 }
let(:dish3) {double :dish3, :item => "item3", :price => 1 }
let(:menu) { double :menu, :menu_list => [dish1,dish2, dish3]}
#let(:menu) {double :menu, :menu_list => }
let(:subject) { subject.new(menu.menu_list) }

	describe '#initiaize' do

		it 'will create an empty array' do
			expect(subject.my_order).to be_empty
		end
	end	
end