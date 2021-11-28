require 'menu'

describe Menu do 
subject(:menu) { Menu.new(menu_items) }
    let(:menu_items) do
    {
        pizza: 8, 
        ramen: 6, 
    }
    end

    it 'stores a list of dishes and their prices' do
    expect(menu.menu_items).to eq(menu_items)
    end
end 