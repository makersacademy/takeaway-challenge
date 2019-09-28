require "menu"

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe "User story 1" do
  it "displays a list of dishes with prices" do
    menu = Menu.new
    menu.add("Ribeye", 2000)
    expect { menu.list }.to output("Ribeye (£20)\n").to_stdout
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
describe "User story 2" do
  it "may order a certain number of each dish" do
    menu = Menu.new
    menu.add("Ribeye", 2000)
    menu.add("Lobster", 3000)
    menu.list
    expect { menu.order("Ribeye", 2) }.not_to raise_error
  end
end