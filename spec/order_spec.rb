require 'order'

describe Order do

    subject(:order){described_class.new}
    let(:item) {double :item, name: :name, price: 1, available: true}
    let(:total_item_count) {double 10}
    let(:total_order_sum) {double 10}
    let(:selection) {1}
    
    it 'can add an item to an order' do
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

    it 'can pick and item from the menu' do
        order.pick_item(selection)
        expect(order.order_list).to include({:available=>true, :name=>"Curry", :price=>2})
    end

    it 'generates total items calculation' do
        order.add_item(2)
        expect(order.item_count).to eq(1) 
    end

    # it 'generate_total_order_sum' do
    #     order.add_item(item)
    #     expect(order.total_order_sum).to eq(1) 
    # end

    # it 'provides an order confirmation summary' do
    #     10.times {order.add_item(item)}
    #     order.generate_sub_totals
    #     expect(order.total_order_text).to eq("Total Order 10 items = £10")  
    # end

    # it 'stops an item being ordered if it is unavailable' do 
    # end

end