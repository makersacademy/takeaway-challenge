require './lib/menu.rb'

RSpec.describe Menu do
   
  it "adds a dish to the menu list" do
    dish = double :dish
    menu = Menu.new
    menu.add(dish)
    expect(menu.list).to eq [dish]
  end

  it "adds multiple dishes to the menu" do
    dish = double :dish
    dish1 = double :dish
    dish2 = double :dish
    menu = Menu.new
    menu.add(dish)
    menu.add(dish1)
    menu.add(dish2)
    expect(menu.list).to eq [dish, dish1, dish2]
  end

  it "removes a dish from the menu" do
    dish = double :dish
    dish1 = double :dish
    dish2 = double :dish
    menu = Menu.new
    menu.add(dish)
    menu.add(dish1)
    menu.add(dish2)
    menu.remove(dish)
    expect(menu.list).to eq [dish1, dish2]
  end

  it "removes dishes from the menu" do
    dish = double :dish
    dish1 = double :dish
    dish2 = double :dish
    menu = Menu.new
    menu.add(dish)
    menu.add(dish1)
    menu.add(dish2)
    menu.remove(dish)
    menu.remove(dish1)
    expect(menu.list).to eq [dish2]
  end

  context "Trying to remove a non-existent dish" do
    it "raises error" do
        dish = double :dish
        dish1 = double :dish
        dish2 = double :dish
        dish3 = double :dish
        menu = Menu.new
        menu.add(dish)
        menu.add(dish1)
        menu.add(dish2)
        expect{menu.remove(dish3)}.to raise_error "unknown dish" 
    end
  end


end