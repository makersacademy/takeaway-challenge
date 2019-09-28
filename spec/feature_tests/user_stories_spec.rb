require "menu"

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe "User story 1" do
  it "displays a list of dishes with prices" do
    menu = Menu.new
    menu.add("Ribeye", 2000)
    expect(menu.list).to eq "Ribeye (£20)\n"
  end
end
