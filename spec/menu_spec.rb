require 'menu.rb'
describe Menu do
  subject(:menu) { described_class.new }
  context "#initialize" do
    it 'create a list if dishes' do
      menu = Menu.new
      expect(menu.dishes).to eq described_class::DISHES_LIST
    end
  end

  context "#print_menu" do
    it 'prints the menu' do
      menu = Menu.new
      expect(menu).to respond_to :print_menu
    end
  end
end
