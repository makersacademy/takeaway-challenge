require './docs/menu.rb' 

describe 'Menu' do
    it 'should return a hash with 4 item inside' do  
        menu = Menu.new
        expect(menu.list).to eq({ 'Latte' => 2.90, 'Cappuccino' => 2.80, 'Cake' => 3.50, 'Sandwich' => 4.00}) 
    end 

    describe 'list_menu' do
        it 'should return alist of strings' do
            menu = Menu.new 
            expect(menu.list_menu.class).to eq(String)
        end
    end
end