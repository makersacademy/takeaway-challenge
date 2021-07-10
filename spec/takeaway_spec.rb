require 'takeaway'

describe Takeaway do
    it 'given there is a menu when asking to view then return menu' do
        menu = subject.view_menu
        expect(menu).to eq([{item: 'chicken', price: 4}, 
            {item: 'beef', price: 6}, 
            {item: 'pork', price: 5}, 
            {item: 'vegetable', price: 3}])
    end
end