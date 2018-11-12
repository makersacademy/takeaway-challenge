require 'menu'

describe Menu do

let(:menu) { described_class.new }
let(:print_menu) { Menu::MENU }

  describe 'print_menu' do
    it 'Prints menu' do
      expect(menu.print_menu).to eq print_menu
    end
  end 

  describe 'select_item' do
    it "Puts item price in selected_items" do
    expect(menu).to receive(:select_items).with("Spider Roll", 2)
    menu.select_items("Spider Roll", 2)
    end
  end


end
