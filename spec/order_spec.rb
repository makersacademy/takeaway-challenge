
require './lib/order'
describe Order do
    it 'expects order to respond to select_item' do
        expect(subject).to respond_to(:select_item)
    end
    it 'expects order to respond to add_item' do
        expect(subject).to respond_to(:add_item)
    end
    
end