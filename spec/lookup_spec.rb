require 'lookup'
require 'menu'
require 'dish'
describe LookUp do
  before(:each) do
    menu = Menu.new
    contents = menu.available_dishes
    @lookup = LookUp.new(contents)
    @dish1 = Dish.new("katsu curry", 15)
    @dish2 = Dish.new("edamame", 3)
    menu.add_dish(@dish1)
    menu.add_dish(@dish2)
  end
    context "#by_name" do
      it "can return a dish object with same name as input" do
        expect(@lookup.by_name("katsu_curry")).to eq(@dish1)
        expect(@lookup.by_name("edamame")).to eq(@dish2)
      end
      it "throws error if item not on menu" do
        expect{@lookup.by_name("not here")}.to raise_error{"Dish not on menu!"}
      end
    end
    context "#by_number" do
      it "can return a dish object by it's number on the menu" do
        expect(@lookup.by_number(1)).to eq(@dish1)
        expect(@lookup.by_number(2)).to eq(@dish2)
      end
      it "throws error if anything other than integer used for lookup" do
        expect { @lookup.by_number("1") }.to raise_error(TypeError)
      end
    end
    context "#dish_number" do
      it "returns the menu number of a given dish object" do
        expect(@lookup.dish_number(@dish1)).to eq(1)
        expect(@lookup.dish_number(@dish2)).to eq(2)
      end
      it "raises error if dish object doesn't exist in list" do
        expect{ @lookup.dish_number(Dish.new("dish 3",5)) }.to raise_error("Dish doesn't exist")
      end
    end
end
