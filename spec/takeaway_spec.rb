require 'takeaway'

describe Menu do

  context "#initialize" do
    it 'menu is truthy' do
      menu = Menu.new
      puts menu
      expect(menu.menulist.keys).to include "Chinese", "Indian", "Italian", "Kebab", "Sandwich", "Condensed Air"

    end

    it "menu is falsy" do
      menu = Menu.new
      expect(menu.menulist.keys).not_to include "Bob"
    end

  end

  it "has a choice" do
    menu = Menu.new
    menu.choice
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

  context "#bill" do

    it "compares total to menu" do
      puts "*******"
      menu = Menu.new
      menu.order("Chinese", 2)
      expect(menu.bill).to include(menu.dishes)
    end

  end

end
