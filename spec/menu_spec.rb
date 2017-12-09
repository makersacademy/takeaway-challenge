require './lib/menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  context '#show_menu' do
    it "Should display the items of the menu" do
      expect(menu.show_menu.length).to eq 3
    end
  end

  context '#choose' do
    it "Should return the dish you order" do
      expect(menu.choose(0)).to eq menu.menu_list[0]
    end
  end

end
