require 'order'

describe Order do 

	let(:menu) {double :menu, dishes: [curry,kebab]}
	let(:curry) {double :dish, name: "curry", price: 500}
	let(:kebab){double :dish, name: "kebab", price: 450}
	let(:order) {Order.new}

	it 'should be able to store a list of dishes' do
		expect(order.item_count).to eq (0)
	end

	it 'should be able to select items from the menu and add them to the list' do
		order.add_item(menu,curry)
		order.add_item(menu,kebab)
		expect(order.item_count).to eq (2)
		expect(order.order_items).to eq [curry,kebab]
	end

	it 'should be able to total the items in the order list if there is one item' do
		order.add_item(menu,curry)
		expect(curry).to receive(:price)
		expect(order.order_total).to eq 500
	end

	it 'should be able to total the item in the order list if there are several items' do 
		order.add_item(menu,curry)
		order.add_item(menu,kebab)
		expect(curry).to receive(:price)
		expect(kebab).to receive(:price)
		expect(order.order_total).to eq 950

	end
	
end