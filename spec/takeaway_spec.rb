require 'takeaway'

describe Menu do

    it 'menu is truthy' do
      menu = Menu.new
      puts menu
      expect(menu.menulist.keys).to include "Chinese", "Indian", "Italian", "Kebab", "Sandwich", "Condensed Air"

    end

    it "menu is falsy" do
      menu = Menu.new
      expect(menu.menulist.keys).not_to include "Bob"
    end

  context "#order" do

    it "takes an order" do
      menu = Menu.new
      expect(menu.order("Chinese", 2)).to eq 16
    end

    it "fails if wrong sum expected" do
      menu = Menu.new
      expect(menu.order("Indian", 2)).not_to eq 10
    end

  end

end
