require "menu"

describe "Feature Tests/User Stories" do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it "displays a list of dishes with prices" do
    menu = Menu.new
    dishes = "dishes"
    expect{menu.see(dishes)}.not_to raise_error
  end

end
