require 'printmenu'

describe PrintMenu do
  before(:each) do
    @menu = Menu.new
  end
  context "#print_dish" do
    it "can print a Dish object" do
      pointer = Dish.new("dish",50)
      @menu.add_dish(pointer)
      expect(subject.print_dish(@menu,pointer)).to eq("\n1. dish £50.00")
    end
    it "can print a dish object with spaces in name field" do
      pointer = Dish.new("a dish",50)
      @menu.add_dish(pointer)
      expect(subject.print_dish(@menu,pointer)).to eq("\n1. a dish £50.00")
    end
  end
  context "#print_body" do
    it "can print all items on a menu" do
      pointer = Dish.new("dish",50)
      pointer2 = Dish.new("dish2",30)
      pointer3 = Dish.new("dish3",10)
      @menu.add_dish(pointer)
      @menu.add_dish(pointer2)
      @menu.add_dish(pointer3)
      expect(subject.print_body(@menu)).to eq("\n1. dish £50.00\n2. dish2 £30.00\n3. dish3 £10.00\n")
    end
  end
  context "#print_header" do
    it "returns contents from menu_header_text.txt" do
      expect { subject.print_header }.to_not raise_error
    end
  end
end
