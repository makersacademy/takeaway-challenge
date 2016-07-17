describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "so user can check if they want to order something, show the list of dishes available with prices" do
    menu = Menu.new
    expect { menu.display_menu}.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "so user can order something, allow user to select some number of several dishes" do
    menu = Menu.new
    expect { menu.select_dishes(:dish, :quantity) }.not_to raise_error
  end


end
