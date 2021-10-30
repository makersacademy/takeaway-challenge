
require './lib/order'
describe Order do
    it 'expects order to respond to select_item' do
        expect(subject).to respond_to(:select_item)
    end
    it 'expects order to respond to add_item' do
        expect(subject).to respond_to(:add_item)
    end

    it 'expects order to respond to select_quantity' do
      expect(subject).to respond_to(:select_quantity)
    end
    it 'expects order to respond to selction_check' do
        expect(subject).to respond_to(:selection_check)
    end

    it 'expects a message if customers item not on menu' do
        order = Order.new
        order.select_item
        expect{order.selection_check}.to raise_error "Sorry your item is not on the menu"
    end
    
end