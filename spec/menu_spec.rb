require_relative '../lib/menu'

describe 'Menu' do

  subject(:menu) { Menu.new }

  # how to intialize with 2 arguments

  context 'view the menu' do

    describe 'shows the menu' do
      it 'initializes with dish and price' do
        menu = Menu.new( 'dish', 'price')
        expect(menu.dish).to eq('dish')
      end


      it 'responds to show menu' do
        menu = Menu.new( 'dish', 'price')
        expect(menu).to respond_to(:show_menu)
      end

    end
  end
end
