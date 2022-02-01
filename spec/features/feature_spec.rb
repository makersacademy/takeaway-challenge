# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe "user story 1" do

  it "can create a menu" do
    menu = Menu.new
    expect(Menu.new).to be_instance_of(Menu)
  end
   
  it "shows what is on the menu" do
    menu = Menu.new
    expect(menu.show_menu).to eq "Dish: Curry, Price: £6.50\nDish: Spagbol, Price: £7.50"
  end
  
  it "can create a dish" do
    dish = Dish.new("Cottage Pie", 8.51)
    expect(dish.name).to eq "Cottage Pie"
    expect(dish.price).to eq 8.51
  end

end
