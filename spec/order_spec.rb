require 'order'

describe Order do

    subject(:order){described_class.new}
    let(:item) {double :item, name: "Food", price: 1, available: true}    
    let(:total_item_count) {double 10}
    let(:total_order_sum) {double 10}
    let(:delivery_time) {double :delivery_time}
    let(:selection) {1}
        
    it 'can add an item to an order' do
        #item = double("item", name: "Food", price: 1, available: true) 
        order.add_item(item)
        expect(order.list_order).to include(item)
    end

    it 'can add several different items to the order' do
        10.times {order.add_item(item)}
        expect(order).to respond_to :list_order
    end

    it 'can count how many items are on the order' do
        10.times {order.add_item(item)}
        expect(order.item_count).to eq 10 
    end

    it 'can pick item from the menu' do
        order.pick_item(selection)
        expect(order.order_list).to include({:available=>true, :name=>"Curry", :price=>2})
    end  

    it 'generates an order time message' do
        t = Time.now + 1*60*60
        delivery_time = t.strftime("%H:%M")
        expect(order.delivery_message).to include(delivery_time)
    end

end