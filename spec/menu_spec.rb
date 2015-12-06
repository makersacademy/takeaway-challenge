
require 'menu'

describe "Menu" do

  describe "#view_menu" do
    it "Displays the menu" do
      menu = Menu.new('lib/menu.yaml')
      expect(menu.view_menu).to eq (YAML.load_file('lib/menu.yaml'))
    end
  end

  describe "#choose" do
    it "Selects an order from the menu" do
      menu = Menu.new('lib/menu.yaml')
      menu.choose([1, 2])
      expect(menu.order).to eq([{:"Kielbasa chicken"=>"£4"}, {:"Doner pig"=>"£5"}])
    end
  end

  # describe ""
  # xit "Shows prices" do
  #   menu = Menu.new
  #   expect(menu.item_price).to return{the value at the key for the item name}
  # end
  #
  # xit "Shows item name" do
  #   menu = Menu.new
  #   exect(menu.item).to eq item
  # end


end
