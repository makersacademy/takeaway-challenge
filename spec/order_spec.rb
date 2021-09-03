require 'order'

describe Order do

    subject(:order){described_class.new}
    let(:item) {double :item, name: :name, price: :price, available: true}
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
        expect(order.list_order).to eq([{:available=>true, :name=>"Curry", :price=>2}])
    end

    # it 'provides an order confirmation summary' do
    #     10.times {order.add_item(item)}
    #     expect(order.summary of items in string).to contain "a string" 

    # end

    # it 'stops an item being ordered if it is unavailable' do 
    # end

end