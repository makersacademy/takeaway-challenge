require 'restaurant'
describe Restaurant do
	 subject(:restaurant) { described_class.new(menu: menu) }
	 
	 let(:menu) { double(:menu, print: printed_menu) }
	 let(:order) { double(:order) }
	 let(:printed_menu) { "Spring roll: £0.99" }
	 it 'creates an instance of a Restaurant' do
 	  expect(subject).to be_a Restaurant
 	end

 	it 'should be able to print menu items' do
	 	 expect(restaurant.print_menu).to eq(printed_menu)
	 end
end
