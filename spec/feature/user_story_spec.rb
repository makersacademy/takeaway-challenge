describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "so user can order something, show the list of dishes available with prices" do
    menu = Menu.new
    expect { menu.display_menu}.not_to raise_error
  end
end
