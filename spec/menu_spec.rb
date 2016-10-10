require 'spec_helper'

describe Menu do

	subject(:upload_menu) {described_class.new}
	let(:item) {double(:item)}
	let(:description) {double(:description)}
	let(:price) {double(:price)} 

	describe '#acquiring menu list' do

		it 'stores a menu item with their description and price as a hash object inside an array' do
			upload_menu.add_items(item,description,price)
			expect(upload_menu.item_list).to match_array([{item: item, description: description, price: price}])
		end
	end

end