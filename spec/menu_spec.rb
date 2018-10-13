require "menu"

describe Menu do

  subject(:menu) { Menu.new }

  let(:dish) { double :dish, :publish_dish => "Blah blah TestDish", :category => "starter", :name => "TestDish", :getname => "TestDish" }

  it "displays the menu when asked by the customer" do
    expect(subject.publish_menu.slice(1, 23)).to eq("     * Here is the menu")
  end

  it "checks if item is in menu and returns true if it is" do
    subject.add_dish_to_menu(dish)
    expect(subject.check_item_in_menu("TestDish")).to eq dish
  end

  it "checks if item is in menu and returns false if it is not" do
    expect(subject.check_item_in_menu("TestDish")).to eq false
  end

  it "throws an error when asked to fetch and item not in the menu" do
    expect { subject.get_dish("TestDish") }.to raise_error("Not in Menu")
  end

  it "correctly returns the dish when requested to fetch an item in the menu" do
    subject.add_dish_to_menu(dish)
    expect(subject.get_dish("TestDish")).to eq dish
  end

  it "adds an item to the menu as the chefs get more creative and its not already in menu" do
    no_of_dish = subject.dishlist.size
    subject.add_dish_to_menu(dish)
    expect(subject.dishlist.size - no_of_dish).to eq 1
  end

  it "throws error if item is already in menu and is being re-added" do
    subject.add_dish_to_menu(dish)
    expect { subject.add_dish_to_menu(dish) }.to raise_error("Dish already exists!")
  end
end
