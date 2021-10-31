
require './lib/order'
describe Order do
    it 'expects order to respond to select_item' do
        expect(subject).to respond_to(:select_item)
    end
    
    it 'expects order to respond to select_quantity' do
      expect(subject).to respond_to(:select_quantity)
    end
    it 'expects order to respond to selction_check' do
        expect(subject).to respond_to(:selection_check)
    end

    it 'expects order to respond to add_item' do
        expect(subject).to respond_to(:add_item)
    end

    it 'expects an error if customers item not on menu' do
        order = Order.new
        order.select_item
        expect{order.selection_check}.to raise_error "Sorry your item is not on the menu"
    end

    it 'checks that the correct quantity has been added to order' do
        order = Order.new
        order.select_item
        #allow(order.select_quantity).to receive(:quantity) {5}
        order.select_quantity #this has been set to 2 in order.rb but would use gets.chomp to get actual customer response.
        order.add_item
        expect(order.order.length).to eq 2
    end
    
end