require 'userinterface'
require 'menu'
require 'printmenu'
require 'basket'
require 'printbasket'
require 'order'
describe UserInterface do
  before(:each) do
    @printmenu = PrintMenu.new
    @printbasket = PrintBasket.new
    @menu = Menu.new
    @menu.add_dish(Dish.new("a dish",1))
    @menu.add_dish(Dish.new("another dish",2))
    @basket = Basket.new
  end
  subject { UserInterface.new(@menu,@basket) }
  context "#see_menu" do
    it "prints the menu to screen" do
      expect(subject.see_menu).to eq(print(@printmenu.print(@menu)))
    end
  end
  context "#add_to_basket" do
    it "adds dish to basket using a string" do
      expect(subject.add_to_basket("a dish")).to eq(@basket.add(@menu.lookup.by_name("a dish")))
    end
    it "adds dish to basket using menu number" do
      expect(subject.add_to_basket("1")).to eq(@basket.add(@menu.lookup.by_number(1)))
      expect(subject.add_to_basket("2")).to eq(@basket.add(@menu.lookup.by_number(2)))
    end
    it "throws error if no match found" do
      expect {subject.add_to_basket("hello moto")}.to raise_error("Dish not on menu!")
    end
  end
  context "#remove_from_basket" do
    it "can remove a dish from the basket" do
      subject.add_to_basket("a dish")
      @basket.add(@menu.lookup.by_name("a dish"))
      expect(subject.remove_from_basket("a dish")).to eq(@basket.remove(@menu.lookup.by_name("a dish")))
    end
  end
  context "#see_basket" do
    it "can print basket to terminal" do
      expect(subject.see_basket).to eq(print(@printbasket.string(@basket)))
    end
  end
end
