require 'menu'

describe Menu do

    subject(:menu){described_class.new}
    let (:dish) {double :dish}

    it 'creates a new menu class' do
        expect(menu).to be_kind_of(Menu)
    end

    it 'adds a dish to the menu' do
        menu.add_dish(dish)
        expect(menu.list_menu).to include(dish)
    end

    it 'lists all the items on the menu' do
        expect(menu).to respond_to :menu_items
    end
    
end
